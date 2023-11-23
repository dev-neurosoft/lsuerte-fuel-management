import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/entities/vehicle_assignment_entity.dart';
import '../../../core/entities/vehicle_entity.dart';
import '../../../core/extension.dart';
import '../../../core/services.dart';

@RoutePage()
class AssignmentView extends StatefulWidget {
  const AssignmentView({super.key});

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  final _pagedController = PagedDataTableController<String, String, VehicleAssignmentEntity>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Asignaciones"),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => FilledButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              child: const Text("Asignar vehículo"),
            ),
          ),
          hgap(10),
        ],
      ),
      endDrawer: Drawer(
        child: VehicleAssignmentForm(
          onVehicleAssigned: () => _pagedController.refresh(),
        ),
      ),
      body: PagedDataTable<String, String, VehicleAssignmentEntity>(
        controller: _pagedController,
        theme: PagedDataTableThemeData(
          rowsTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          headerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          footerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
        ),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          try {
            final builder = database.from(VehicleAssignmentEntity.tableName).select<PostgrestListResponse>(
                VehicleAssignmentEntity.select, const FetchOptions(count: CountOption.exact));

            if (pageToken.isNotEmpty) {
              builder.lt(VehicleAssignmentEntity.primaryKey, pageToken);
            }

            final PostgrestResponse(:count, :data) =
                await builder.limit(pageSize).order(VehicleAssignmentEntity.primaryKey);

            final vehicles = data?.map((e) => VehicleAssignmentEntity.fromJson(e)).toList() ?? [];
            final nextPage = vehicles.length < pageSize ? null : vehicles.last.id;

            return PaginationResult.items(elements: vehicles, size: count, nextPageToken: nextPage);
          } on PostgrestException catch (error) {
            return PaginationResult.error(error: error.message);
          }
        },
        initialPage: "",
        columns: [
          TableColumn(
            sizeFactor: null,
            title: "Vehículo",
            cellBuilder: (assignment) => Text(assignment.vehicle.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Usuario nombre",
            cellBuilder: (assignment) => Text(assignment.user.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Usuario identificador",
            cellBuilder: (assignment) => Text(assignment.user.email ?? ""),
          ),
          TextTableColumn(
            sizeFactor: null,
            title: "Galones",
            getter: (assignment) => assignment.quantity.toStringAsFixed(1),
            setter: (item, newValue, rowIndex) => database
                .from(VehicleAssignmentEntity.tableName)
                .update({"quantity": newValue})
                .eq(VehicleAssignmentEntity.primaryKey, item.id)
                .then((_) => true)
                .onError((_, __) => false),
          ),
          TableColumn(
            title: "Acciones",
            cellBuilder: (assignment) => TextButton(
              onPressed: () => database
                  .from(VehicleAssignmentEntity.tableName)
                  .delete()
                  .eq(VehicleAssignmentEntity.primaryKey, assignment.id)
                  .then((value) => _pagedController.refresh())
                  .onError(
                    (error, _) => context.scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                      ),
                    ),
                  ),
              child: const Text("Quitar"),
            ),
          ),
        ],
        idGetter: (item) => item.id,
      ),
    );
  }
}

class VehicleAssignmentForm extends StatelessWidget {
  VehicleAssignmentForm({super.key, required this.onVehicleAssigned});

  final VoidCallback onVehicleAssigned;

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(BuildContext context) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final user = _formKey.currentState?.value["user"] as UserEntity;
    final vehicle = _formKey.currentState?.value["vehicle"] as VehicleEntity;
    final quantity = _formKey.currentState?.value["quantity"];

    return database
        .from(VehicleAssignmentEntity.tableName)
        .insert({
          "user_id": user.id,
          "vehicle_id": vehicle.id,
          "quantity": quantity ?? 0,
        })
        .then((_) => onVehicleAssigned())
        .then((_) => Navigator.of(context).pop())
        .onError(
          (error, _) => context.scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asignar vehículo"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => _onSubmit(context),
                child: const Text("Asignar"),
              ),
            ),
          ],
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: p16,
          children: [
            FormBuilderSearchableDropdown<UserEntity>(
              name: 'user',
              compareFn: (item1, item2) => item1 == item2,
              decoration: const InputDecoration(label: Text("Usuario")),
              asyncItems: (text) => database
                  .from(UserEntity.tableName)
                  .select<PostgrestList>(UserEntity.select)
                  .ilike("name", "%$text%")
                  .withConverter<List<UserEntity>>((data) => data.map((e) => UserEntity.fromJson(e)).toList()),
              itemAsString: (item) => item.name,
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderSearchableDropdown<VehicleEntity>(
              name: 'vehicle',
              decoration: const InputDecoration(label: Text("Vehículo")),
              compareFn: (item1, item2) => item1 == item2,
              asyncItems: (text) => database
                  .from(VehicleEntity.tableName)
                  .select<PostgrestList>(VehicleEntity.select)
                  .ilike("name", "%$text%")
                  .withConverter<List<VehicleEntity>>((data) => data.map((e) => VehicleEntity.fromJson(e)).toList()),
              itemAsString: (item) => item.name,
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderTextField(
              name: 'quantity',
              decoration: const InputDecoration(
                label: Text("Galones (Opcional)"),
              ),
              validator: FormBuilderValidators.numeric(),
            )
          ],
        ),
      ),
    );
  }
}

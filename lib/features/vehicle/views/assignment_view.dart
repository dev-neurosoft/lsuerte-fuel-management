import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/entities/vehicle_assignment_entity.dart';
import '../../../core/entities/vehicle_entity.dart';
import '../../../core/entities/vehicle_kilometres_entity.dart';
import '../../../core/extension.dart';
import '../../../core/services.dart';
import '../../../widgets/async_drop_down.dart';

@RoutePage()
class AssignmentView extends StatefulWidget {
  const AssignmentView({super.key});

  @override
  State<AssignmentView> createState() => _AssignmentViewState();
}

class _AssignmentViewState extends State<AssignmentView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: "Historial de kilometrajes"),
                Tab(text: "Asignaciones"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HistoryOfKilometresView(),
                  AssignedListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignedListView extends StatefulWidget {
  const AssignedListView({super.key});

  @override
  State<AssignedListView> createState() => _AssignedListViewState();
}

class _AssignedListViewState extends State<AssignedListView> {
  final _pagedController = PagedDataTableController<String, String, VehicleAssignmentEntity>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Asignaciones"),
        centerTitle: false,
        actions: [
          FilledButton.icon(
            label: const Text("Recargar"),
            icon: const Icon(Icons.refresh),
            onPressed: () => _pagedController.refresh(),
            style: FilledButton.styleFrom(
              backgroundColor: MaterialStateColor.resolveWith(
                (_) => context.colorScheme.secondary,
              ),
            ),
          ),
          hgap(10),
          Builder(
            builder: (context) => FilledButton.icon(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              label: const Text("Asignar vehículo"),
              icon: const Icon(Icons.add),
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

class HistoryOfKilometresView extends StatefulWidget {
  const HistoryOfKilometresView({super.key});

  @override
  State<HistoryOfKilometresView> createState() => _HistoryOfKilometresViewState();
}

class _HistoryOfKilometresViewState extends State<HistoryOfKilometresView> {
  final _pagedController = PagedDataTableController<String, String, VehicleKilometresEntity>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: VehicleKilometresFormView(
          onVehicleKilometresCreated: () => _pagedController.refresh(),
        ),
      ),
      body: PagedDataTable<String, String, VehicleKilometresEntity>(
        controller: _pagedController,
        rowsSelectable: false,
        theme: PagedDataTableThemeData(
          rowsTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          headerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          footerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
        ),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          try {
            final builder = database.from(VehicleKilometresEntity.tableName).select<PostgrestListResponse>(
                VehicleKilometresEntity.select, const FetchOptions(count: CountOption.exact));

            if (filtering.has("user")) {
              builder.eq("user_id", filtering.valueOrNull("user").id);
            }

            if (filtering.has("vehicle")) {
              builder.eq("vehicle_id", filtering.valueOrNull("vehicle").id);
            }

            if (filtering.has("date")) {
              builder.eq("effective_date_text", DateFormat("yyyy-MM-dd").format(filtering.valueOrNull("date")));
            }

            final PostgrestResponse(:count, :data) = await builder
                .limit(pageSize)
                .order("effective_date", ascending: false)
                .order("created_at", ascending: false);

            final fuels = data?.map((e) => VehicleKilometresEntity.fromJson(e)).toList() ?? [];
            final nextPage = fuels.length < pageSize ? null : fuels.last.id;

            return PaginationResult.items(elements: fuels, size: count, nextPageToken: nextPage);
          } on PostgrestException catch (error) {
            return PaginationResult.error(error: error.message);
          }
        },
        initialPage: "",
        filters: [
          AsyncVehicleDropDownFilter(
            id: "vehicle",
            title: "Vehiculos",
            chipFormatter: (fuel) => "Vehiculo: ${fuel.name}",
          ),
          AsyncUserDropDownFilter(
            id: "user",
            title: "Conductores",
            chipFormatter: (user) => "Usuario: ${user.name}",
          ),
          DatePickerTableFilter(
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
            id: "date",
            title: "Fecha",
            chipFormatter: (date) => "Fecha: ${DateFormat("dd/MM/yyyy").format(date)}",
          ),
        ],
        header: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton.icon(
              onPressed: () => _pagedController.refresh(),
              label: const Text("Recargar"),
              icon: const Icon(Icons.refresh),
              style: FilledButton.styleFrom(
                backgroundColor: MaterialStateColor.resolveWith(
                  (_) => context.colorScheme.secondary,
                ),
              ),
            ),
            hgap(5),
            Builder(
              builder: (context) => FilledButton.icon(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                label: const Text("Registrar"),
                icon: const Icon(Icons.add),
              ),
            ),
            hgap(5),
          ],
        ),
        columns: [
          TableColumn(
            sizeFactor: null,
            title: "Vehiculo",
            cellBuilder: (vehicleKilometres) => Text(vehicleKilometres.vehicle.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Conductor",
            cellBuilder: (vehicleKilometres) => Text(vehicleKilometres.user.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Fecha de vigencia",
            cellBuilder: (vehicleKilometres) =>
                Text(DateFormat("dd/MM/yyyy", "es").format(vehicleKilometres.effectiveDate)),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Entrada Kilometros",
            cellBuilder: (vehicleKilometres) =>
                Text(NumberFormat.currency(symbol: "").format(vehicleKilometres.inKilometres)),
          ),
          TextTableColumn(
            sizeFactor: null,
            title: "Salida Kilometros",
            getter: (vehicleKilometres) => vehicleKilometres.outKilometres?.toStringAsFixed(2),
            setter: (vehicleKilometres, newValue, rowIndex) => database
                .rpc("add_or_update_vehicle_kilometres", params: {
                  "in_vehicle_kilometre_id": vehicleKilometres.id,
                  "in_vehicle_id": vehicleKilometres.vehicle.id,
                  "in_user_id": vehicleKilometres.user.id,
                  "in_effective_date": vehicleKilometres.effectiveDate.toIso8601String(),
                  "in_in_kilometres": vehicleKilometres.inKilometres.toDouble(),
                  "in_out_kilometres": double.tryParse(newValue),
                  "in_created_by": vehicleKilometres.createdBy.id,
                })
                .then((_) => true)
                .onError((error, __) {
                  debugPrint(error.toString());
                  return false;
                }),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Creado por",
            cellBuilder: (vehicleKilometres) => Text(vehicleKilometres.createdBy.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Fecha de creación",
            cellBuilder: (vehicleKilometres) =>
                Text(DateFormat("dd/MM/yyyy hh:mm a", "es").format(vehicleKilometres.createdAt)),
          ),
        ],
        idGetter: (item) => item.id,
      ),
    );
  }
}

class VehicleKilometresFormView extends StatelessWidget {
  VehicleKilometresFormView({
    super.key,
    required this.onVehicleKilometresCreated,
  });

  final VoidCallback onVehicleKilometresCreated;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(
    BuildContext context,
    ValueChanged<String> onError,
  ) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final effectiveDate = _formKey.currentState?.value["effectiveDate"] as DateTime;
    final vehicle = _formKey.currentState?.value["vehicle"] as VehicleEntity;
    final user = _formKey.currentState?.value["user"] as UserEntity;
    final inKilometres = _formKey.currentState?.value["inKilometres"];
    final now = DateTime.now();

    try {
      await database.rpc("add_or_update_vehicle_kilometres", params: {
        "in_vehicle_kilometre_id": null,
        "in_vehicle_id": vehicle.id,
        "in_user_id": user.id,
        "in_effective_date": effectiveDate
            .copyWith(
              hour: now.hour,
              minute: now.minute,
              second: now.second,
            )
            .toIso8601String(),
        "in_in_kilometres": inKilometres,
        "in_out_kilometres": 0.0,
        "in_created_by": authController.user?.id,
      });

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      onVehicleKilometresCreated();
    } on PostgrestException catch (error) {
      onError(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Registrar Kilometraje"),
        centerTitle: true,
        elevation: 1,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => _onSubmit(
                  context,
                  (message) {
                    context.scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text(message), showCloseIcon: true),
                    );
                  },
                ),
                child: const Text("Registrar"),
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
            FormBuilderDateTimePicker(
              name: 'effectiveDate',
              decoration: const InputDecoration(label: Text("Fecha")),
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy", "es"),
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
            FormBuilderSearchableDropdown<UserEntity>(
              name: 'user',
              compareFn: (item1, item2) => item1 == item2,
              decoration: const InputDecoration(label: Text("Conductor")),
              asyncItems: (text) => database
                  .from(UserEntity.tableName)
                  .select<PostgrestList>(UserEntity.select)
                  .ilike("name", "%$text%")
                  .withConverter<List<UserEntity>>((data) => data.map((e) => UserEntity.fromJson(e)).toList()),
              itemAsString: (item) => item.name,
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderTextField(
              name: 'inKilometres',
              decoration: const InputDecoration(label: Text("Kilometros")),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
            ),
            vgap(10),
          ],
        ),
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/fuel_entity.dart';
import '../../../core/entities/vehicle_brand_entity.dart';
import '../../../core/entities/vehicle_entity.dart';
import '../../../core/entities/vehicle_model_entity.dart';
import '../../../core/extension.dart';
import '../../../core/get_it.dart';
import '../../../core/services.dart';
import '../controllers/vehicle_controller.dart';

@RoutePage()
class VehicleView extends StatefulWidget {
  const VehicleView({super.key});

  @override
  State<VehicleView> createState() => _VehicleViewState();
}

class _VehicleViewState extends State<VehicleView> {
  final _controller = getIt.get<VehicleController>();
  final _pagedController = PagedDataTableController<String, String, VehicleEntity>();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _controller.initialize(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vehículos"),
          centerTitle: false,
          actions: [
            Builder(
              builder: (context) => TextButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                child: const Text("Agregar Vehículo"),
              ),
            ),
            hgap(10),
          ],
        ),
        endDrawer: Drawer(
          child: VehicleForm(
            onVehicleCreated: () => _pagedController.refresh(),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, state, child) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            failure: (message) => Center(
              child: Text(message ?? ""),
            ),
            success: (brands, models, fuels) => PagedDataTable<String, String, VehicleEntity>(
              initialPage: "",
              idGetter: (item) => item.id,
              fetchPage: (pageToken, pageSize, sortBy, filtering) async {
                try {
                  final builder = database.from(VehicleEntity.tableName).select<PostgrestListResponse>(
                      VehicleEntity.select, const FetchOptions(count: CountOption.exact));

                  if (pageToken.isNotEmpty) {
                    builder.lt(VehicleEntity.primaryKey, pageToken);
                  }

                  if (filtering.has("code")) {
                    builder.ilike("code", filtering.valueOrNull("code"));
                  }

                  if (filtering.has("brand")) {
                    builder.eq("brand_id", filtering.valueOrNull("brand").id);
                  }

                  if (filtering.has("fuel")) {
                    builder.eq("fuel_id", filtering.valueOrNull("fuel").id);
                  }

                  final PostgrestResponse(:count, :data) =
                      await builder.limit(pageSize).order(VehicleBrandEntity.primaryKey);
                  final vehicles = data?.map((e) => VehicleEntity.fromJson(e)).toList() ?? [];
                  final nextPage = vehicles.length < pageSize ? null : vehicles.last.id;

                  return PaginationResult.items(elements: vehicles, size: count, nextPageToken: nextPage);
                } on PostgrestException catch (error) {
                  return PaginationResult.error(error: error.message);
                }
              },
              filters: [
                TextTableFilter(
                  id: "code",
                  title: "Matricula",
                  chipFormatter: (text) => "Matricula: $text",
                ),
                DropdownTableFilter(
                  items: brands.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    );
                  }).toList(),
                  chipFormatter: (text) => "Marca: ${text.name}",
                  id: "brand",
                  title: "Marca",
                ),
                DropdownTableFilter(
                  items: fuels.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    );
                  }).toList(),
                  chipFormatter: (text) => "Combustible: ${text.name}",
                  id: "fuel",
                  title: "Combustible",
                ),
              ],
              columns: [
                TextTableColumn(
                  sizeFactor: null,
                  getter: (item) => item.code,
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"code": newValue})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  title: "Matricula",
                ),
                DropdownTableColumn(
                  sizeFactor: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.transparent,
                  ),
                  getter: (item) => item.brand,
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"brand_id": newValue.id, "name": item.copyWith(brand: newValue).name})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  items: brands.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  title: "Marca",
                ),
                DropdownTableColumn(
                  sizeFactor: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.transparent,
                  ),
                  getter: (item) => item.model,
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"model_id": newValue.id, "name": item.copyWith(model: newValue).name})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  items: models.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  title: "Modelo",
                ),
                DropdownTableColumn(
                  sizeFactor: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.transparent,
                  ),
                  getter: (item) => item.fuel,
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"fuel_id": newValue.id})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  items: fuels.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  title: "Combustible",
                ),
                TextTableColumn(
                  sizeFactor: null,
                  getter: (item) => item.fuelQuantity?.toString(),
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"fuel_quantity": newValue})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  title: "Capacidad Tanque",
                ),
                TextTableColumn(
                  sizeFactor: null,
                  getter: (item) => item.year.toString(),
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"year": newValue, "name": item.copyWith(year: num.parse(newValue)).name})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  title: "Año",
                ),
                TextTableColumn(
                  getter: (item) => item.kilometres?.toString(),
                  setter: (item, newValue, rowIndex) => database
                      .from(VehicleEntity.tableName)
                      .update({"kilometres": newValue})
                      .eq(VehicleEntity.primaryKey, item.id)
                      .then((_) => true)
                      .onError((_, __) => false),
                  title: "Kilometros",
                ),
              ],
            ),
          ),
        ));
  }
}

class VehicleForm extends StatelessWidget {
  VehicleForm({super.key, required this.onVehicleCreated});

  final VoidCallback onVehicleCreated;

  final _formKey = GlobalKey<FormBuilderState>();
  final _controller = getIt.get<VehicleController>();

  Future<void> onSubmit(BuildContext context) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final brand = _formKey.currentState?.value["brand"] as VehicleBrandEntity;
    final model = _formKey.currentState?.value["model"] as VehicleModelEntity;
    final fuel = _formKey.currentState?.value["fuel"] as FuelEntity;
    final year = _formKey.currentState?.value["year"];
    final quantity = _formKey.currentState?.value["quantity"];
    final code = _formKey.currentState?.value["code"];
    final kilometres = _formKey.currentState?.value["kilometres"];

    await database
        .from(VehicleEntity.tableName)
        .insert({
          "brand_id": brand.id,
          "model_id": model.id,
          "fuel_id": fuel.id,
          "fuel_quantity": quantity,
          "code": code,
          "kilometres": kilometres,
          "year": year,
          "name": "${brand.name} ${model.name} $year",
        })
        .then((_) => onVehicleCreated())
        .then((_) => Navigator.of(context).pop())
        .onError(
          (error, stackTrace) => context.scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.watch(
        (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (message) => Center(child: Text(message ?? "")),
          success: (brands, models, fuels) => FormBuilder(
            key: _formKey,
            child: ListView(
              padding: p12,
              children: [
                FormBuilderDropdown(
                  name: 'brand',
                  decoration: const InputDecoration(label: Text("Marca")),
                  items: brands.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  validator: FormBuilderValidators.required(),
                ),
                vgap(10),
                FormBuilderDropdown(
                  name: 'model',
                  decoration: const InputDecoration(label: Text("Modelo")),
                  items: models.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  validator: FormBuilderValidators.required(),
                ),
                vgap(10),
                FormBuilderDropdown(
                  name: 'fuel',
                  decoration: const InputDecoration(label: Text("Combustible")),
                  items: fuels.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    },
                  ).toList(),
                  validator: FormBuilderValidators.required(),
                ),
                vgap(10),
                FormBuilderTextField(
                  name: 'year',
                  decoration: const InputDecoration(label: Text("Año")),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                ),
                vgap(10),
                FormBuilderTextField(
                  name: 'quantity',
                  decoration: const InputDecoration(label: Text("Capacidad Tanque Galones (Opcional)")),
                  validator: FormBuilderValidators.numeric(),
                ),
                vgap(10),
                FormBuilderTextField(
                  name: 'code',
                  decoration: const InputDecoration(label: Text("Matricula")),
                  validator: FormBuilderValidators.required(),
                ),
                vgap(10),
                FormBuilderTextField(
                  name: 'kilometres',
                  decoration: const InputDecoration(label: Text("Kilometros (Opcional)")),
                  validator: FormBuilderValidators.numeric(),
                ),
                vgap(10),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Agregar vehículo"),
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
                onPressed: () => onSubmit(context),
                child: const Text("Agregar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

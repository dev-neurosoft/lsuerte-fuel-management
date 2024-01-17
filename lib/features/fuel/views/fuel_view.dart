import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/fuel_entity.dart';
import '../../../core/entities/fuel_price_entity.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/extension.dart';
import '../../../core/services.dart';
import '../../../widgets/async_drop_down.dart';

@RoutePage()
class FuelView extends StatelessWidget {
  const FuelView({super.key});

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
                Tab(text: "Historial de Precios"),
                Tab(text: "Lista de Combustibles"),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                FuelPriceView(),
                FuelDetailView(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class FuelDetailView extends StatelessWidget {
  const FuelDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedDataTable<String, String, FuelEntity>(
        rowsSelectable: false,
        theme: PagedDataTableThemeData(
          rowsTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          headerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          footerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
        ),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          try {
            final fuels = await database
                .from(FuelEntity.tableName)
                .select<PostgrestList>()
                .order("name")
                .withConverter<List<FuelEntity>>((data) => data.map((e) => FuelEntity.fromJson(e)).toList());

            return PaginationResult.items(elements: fuels);
          } on PostgrestException catch (error) {
            return PaginationResult.error(error: error.message);
          }
        },
        initialPage: "",
        columns: [
          TextTableColumn(
            sizeFactor: null,
            title: "Combustible",
            getter: (item) => item.name,
            setter: (item, newValue, rowIndex) => database
                .from(FuelEntity.tableName)
                .update({"name": newValue})
                .eq(FuelEntity.primaryKey, item.id)
                .then((_) => true)
                .onError((_, __) => false),
          ),
          TextTableColumn(
            sizeFactor: null,
            title: "Cantidad",
            getter: (item) => item.quantity.toStringAsFixed(2),
            setter: (item, newValue, rowIndex) => database
                .from(FuelEntity.tableName)
                .update({"quantity": double.parse(newValue)})
                .eq(FuelEntity.primaryKey, item.id)
                .then((_) => true)
                .onError((error, __) => false),
          ),
        ],
        idGetter: (item) => item.id,
      ),
    );
  }
}

class FuelPriceView extends StatefulWidget {
  const FuelPriceView({super.key});

  @override
  State<FuelPriceView> createState() => _FuelPriceViewState();
}

class _FuelPriceViewState extends State<FuelPriceView> {
  final _pagedController = PagedDataTableController<String, String, FuelPriceEntity>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: FuelPriceFormView(
          onSubmited: () => _pagedController.refresh(),
        ),
      ),
      body: PagedDataTable<String, String, FuelPriceEntity>(
        controller: _pagedController,
        rowsSelectable: false,
        theme: PagedDataTableThemeData(
          rowsTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          headerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          footerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
        ),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          try {
            final builder = database
                .from(FuelPriceEntity.tableName)
                .select<PostgrestListResponse>(FuelPriceEntity.select, const FetchOptions(count: CountOption.exact));

            if (filtering.has("fuel")) {
              builder.eq("fuel_id", filtering.valueOrNull("fuel").id);
            }

            if (filtering.has("date")) {
              builder.eq("effective_date_text", DateFormat("yyyy-MM-dd").format(filtering.valueOrNull("date")));
            }

            final PostgrestResponse(:count, :data) = await builder
                .limit(pageSize)
                .order("effective_date", ascending: false)
                .order("created_at", ascending: false);

            final fuels = data?.map((e) => FuelPriceEntity.fromJson(e)).toList() ?? [];
            final nextPage = fuels.length < pageSize ? null : fuels.last.id;

            return PaginationResult.items(elements: fuels, size: count, nextPageToken: nextPage);
          } on PostgrestException catch (error) {
            return PaginationResult.error(error: error.message);
          }
        },
        initialPage: "",
        filters: [
          AsyncFuelDropDownFilter(
            id: "fuel",
            title: "Combustible",
            chipFormatter: (fuel) => "Combustible: ${fuel.name}",
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
            title: "Combustible",
            cellBuilder: (fuelPrice) => Text(fuelPrice.fuel.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Fecha de vigencia",
            cellBuilder: (fuelPrice) => Text(DateFormat("dd/MM/yyyy", "es").format(fuelPrice.effectiveDate)),
          ),
          if (authController.user?.canDeativateTicket ?? false)
            TextTableColumn(
              sizeFactor: null,
              title: "Precio",
              getter: (fuelPrice) => fuelPrice.price.toStringAsFixed(2),
              setter: (fuelPrice, newValue, rowIndex) => database
                  .from(FuelPriceEntity.tableName)
                  .update({"price": double.parse(newValue)})
                  .eq(FuelPriceEntity.primaryKey, fuelPrice.id)
                  .then((_) => true)
                  .onError((_, __) => false),
            )
          else
            TableColumn(
              sizeFactor: null,
              title: "Precio",
              cellBuilder: (fuelPrice) => Text(NumberFormat.currency(symbol: r"RD$").format(fuelPrice.price)),
            ),
          TableColumn(
            sizeFactor: null,
            title: "Creado por",
            cellBuilder: (fuelPrice) => Text(fuelPrice.createdBy.name),
          ),
          TableColumn(
            sizeFactor: null,
            title: "Fecha de creación",
            cellBuilder: (fuelPrice) => Text(DateFormat("dd/MM/yyyy hh:mm a", "es").format(fuelPrice.createdAt)),
          ),
        ],
        idGetter: (item) => item.id,
      ),
    );
  }
}

class FuelPriceFormView extends StatelessWidget {
  FuelPriceFormView({super.key, required this.onSubmited});

  final VoidCallback onSubmited;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(
    BuildContext context,
    ValueChanged<String> onError,
  ) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final fuel = _formKey.currentState?.value["fuel"] as FuelEntity;
    final effectiveDate = _formKey.currentState?.value["effectiveDate"] as DateTime;
    final price = _formKey.currentState?.value["price"];
    final now = DateTime.now();

    try {
      await database.from(FuelPriceEntity.tableName).insert({
        "fuel_id": fuel.id,
        "effective_date": effectiveDate
            .copyWith(
              hour: now.hour,
              minute: now.minute,
              second: now.second,
            )
            .toIso8601String(),
        "price": price,
        "created_by": authController.user?.id,
        "effective_date_text": DateFormat("yyyy-MM-dd").format(effectiveDate),
      });

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      onSubmited();
    } on PostgrestException catch (error) {
      onError(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        elevation: 1,
        title: const Text("Registrar precio"),
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
            )
          ],
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: p16,
          children: [
            FormBuilderSearchableDropdown<FuelEntity>(
              name: 'fuel',
              decoration: const InputDecoration(label: Text("Combustible")),
              compareFn: (item1, item2) => item1 == item2,
              asyncItems: (text) => database
                  .from(FuelEntity.tableName)
                  .select<PostgrestList>(FuelEntity.select)
                  .ilike("name", "%$text%")
                  .withConverter<List<FuelEntity>>((data) => data.map((e) => FuelEntity.fromJson(e)).toList()),
              itemAsString: (item) => item.name,
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderDateTimePicker(
              name: 'effectiveDate',
              decoration: const InputDecoration(label: Text("Fecha")),
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy hh:mm a", "es"),
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderTextField(
              name: 'price',
              decoration: const InputDecoration(label: Text("Precio (Galón)")),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/entities/fuel_entity.dart';
import '../../../core/extension.dart';
import '../../../core/services.dart';

@RoutePage()
class FuelView extends StatelessWidget {
  const FuelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Combustibles"),
        centerTitle: false,
      ),
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
            title: "Cantidad disponible",
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

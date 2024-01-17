import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../core/entities/fuel_entity.dart';
import '../core/services.dart';

class AsyncFuelDropDownFilter extends TableFilter<FuelEntity> {
  AsyncFuelDropDownFilter({
    required super.chipFormatter,
    required super.id,
    required super.title,
    super.defaultValue,
  }) : super(visible: true);

  final _dropDownSearchController = TextEditingController();

  @override
  Widget buildPicker(BuildContext context, TableFilterState state) {
    return DropDownSearchField<FuelEntity>(
      displayAllSuggestionWhenTap: false,
      onSuggestionSelected: (suggestion) {
        _dropDownSearchController.text = suggestion.name;
        state.value = suggestion;
      },
      suggestionsCallback: (name) async {
        try {
          final fuels = await database
              .from(FuelEntity.tableName)
              .select<PostgrestList>(FuelEntity.select)
              .ilike("name", "%$name%")
              .withConverter<List<FuelEntity>>((data) => data.map((e) => FuelEntity.fromJson(e)).toList());

          return fuels;
        } on PostgrestException catch (error) {
          debugPrint(error.toString());
          return [];
        }
      },
      itemBuilder: (context, item) => ListTile(
        leading: const Icon(Icons.person_outline),
        title: Text(item.name),
        subtitle: Text(item.name),
      ),
      textFieldConfiguration: TextFieldConfiguration(
        controller: _dropDownSearchController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: title,
        ),
      ),
    );
  }
}

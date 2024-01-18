import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../core/entities/fuel_entity.dart';
import '../core/entities/user_entity.dart';
import '../core/entities/vehicle_entity.dart';
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
              .limit(10)
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

class AsyncVehicleDropDownFilter extends TableFilter<VehicleEntity> {
  AsyncVehicleDropDownFilter({
    required super.chipFormatter,
    required super.id,
    required super.title,
    super.defaultValue,
  }) : super(visible: true);

  final _dropDownSearchController = TextEditingController();

  @override
  Widget buildPicker(BuildContext context, TableFilterState state) {
    return DropDownSearchField<VehicleEntity>(
      displayAllSuggestionWhenTap: false,
      onSuggestionSelected: (suggestion) {
        _dropDownSearchController.text = suggestion.name;
        state.value = suggestion;
      },
      suggestionsCallback: (name) async {
        try {
          final vehicles = await database
              .from(VehicleEntity.tableName)
              .select<PostgrestList>(VehicleEntity.select)
              .ilike("name", "%$name%")
              .limit(10)
              .withConverter<List<VehicleEntity>>((data) => data.map((e) => VehicleEntity.fromJson(e)).toList());

          return vehicles;
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

class AsyncUserDropDownFilter extends TableFilter<UserEntity> {
  AsyncUserDropDownFilter({
    required super.chipFormatter,
    required super.id,
    required super.title,
    super.defaultValue,
  }) : super(visible: true);

  final _dropDownSearchController = TextEditingController();

  @override
  Widget buildPicker(BuildContext context, TableFilterState state) {
    return DropDownSearchField<UserEntity>(
      displayAllSuggestionWhenTap: false,
      onSuggestionSelected: (suggestion) {
        _dropDownSearchController.text = suggestion.name;
        state.value = suggestion;
      },
      suggestionsCallback: (name) async {
        try {
          final users = await database
              .from(UserEntity.tableName)
              .select<PostgrestList>(UserEntity.select)
              .ilike("name", "%$name%")
              .limit(10)
              .withConverter<List<UserEntity>>((data) => data.map((e) => UserEntity.fromJson(e)).toList());

          return users;
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

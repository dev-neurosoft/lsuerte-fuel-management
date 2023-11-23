import 'package:async_button_builder/async_button_builder.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/betting_bank_entity.dart';
import '../../../core/entities/ticket_detail_entity.dart';
import '../../../core/entities/ticket_entity.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/entities/vehicle_assignment_entity.dart';
import '../../../core/entities/vehicle_entity.dart';
import '../../../core/extension.dart';
import '../../../core/router.dart';
import '../../../core/services.dart';

@RoutePage()
class TicketFormView extends StatefulWidget {
  const TicketFormView({super.key});

  @override
  State<TicketFormView> createState() => _TicketFormViewState();
}

class _TicketFormViewState extends State<TicketFormView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _details = ValueNotifier<List<TicketDetailEntity>>([]);

  void _onDetailAdded(BuildContext context) {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final user = _formKey.currentState?.value["user"] as UserEntity;
    final vehicle = _formKey.currentState?.value["vehicle"] as VehicleEntity;
    final bettingBank = _formKey.currentState?.value["bank"] as BettingBankEntity?;
    final quantity = _formKey.currentState?.value["quantity"];

    _details.value = [
      ..._details.value,
      TicketDetailEntity(
        vehicle: vehicle,
        bettingBank: bettingBank,
        fuel: vehicle.fuel,
        quantity: num.parse(quantity),
        user: user,
      )
    ];

    _formKey.currentState?.fields["quantity"]?.reset();
    _formKey.currentState?.fields["bank"]?.reset();
  }

  void _onRemove(TicketDetailEntity detail) {
    final currentDetails = [..._details.value];

    currentDetails.remove(detail);
    _details.value = currentDetails;
  }

  Future<void> _onPrint(BuildContext context, TicketEntity ticket) async {
    return printerRepository.printTicket(ticket);
  }

  Future<void> _onSubmit(BuildContext context) async {
    _formKey.currentState?.save();

    final userId = authController.userId;
    final details = [..._details.value];
    final note = _formKey.currentState?.value["note"];

    if (details.isEmpty) {
      context.scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Debe agregar vehiculos al ticket"),
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await database
        .rpc("add_or_update_ticket", params: {
          "in_ticket_id": null,
          "in_created_by": userId,
          "in_requested_by": userId,
          "in_created_at": DateTime.now().toIso8601String(),
          "in_note": note,
          "in_details": details.map(
            (detail) {
              return {
                'vehicle_id': detail.vehicle.id,
                'betting_bank_id': detail.bettingBank?.id,
                'fuel_id': detail.vehicle.fuel.id,
                'fuel_quantity': detail.quantity,
                'note': detail.note,
                "user_id": detail.user.id,
              };
            },
          ).toList()
        })
        .select()
        .then(
          (rawTicket) => database
              .from(TicketEntity.tableName)
              .select(TicketEntity.select)
              .eq(TicketEntity.primaryKey, rawTicket["id"])
              .maybeSingle()
              .withConverter<TicketEntity>((data) => TicketEntity.fromJson(data)),
        )
        .then((ticket) => _onPrint(context, ticket.copyWith(details: details)))
        .then(
          (_) => context.scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text("Ticket procesado correctamente"),
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            ),
          ),
        )
        .onError(
          (error, __) => context.scaffoldMessenger.showSnackBar(
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Crear Ticket"),
        actions: [
          hgap(10),
          IconButton(onPressed: () => router.replace(const TicketRoute()), icon: const Icon(Icons.close)),
          hgap(10),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 400,
              child: AsyncButtonBuilder(
                child: const Text('Crear'),
                onPressed: () => _onSubmit(context),
                builder: (context, child, callback, _) {
                  return FilledButton(
                    onPressed: callback,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: p12,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        label: Text("Usuario"),
                        isDense: true,
                      ),
                      initialValue: authController.userName,
                    ),
                  ),
                  hgap(5),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        label: Text("Fecha"),
                        isDense: true,
                      ),
                      initialValue: DateFormat("dd/MM/yyyy").format(DateTime.now()),
                    ),
                  ),
                  hgap(5),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        label: Text("Hora"),
                        isDense: true,
                      ),
                      initialValue: DateFormat("hh:mm a").format(DateTime.now()),
                    ),
                  ),
                  hgap(5),
                  Flexible(
                    child: FormBuilderSearchableDropdown<VehicleAssignmentEntity>(
                      name: 'assignment',
                      compareFn: (item1, item2) => item1 == item2,
                      decoration: const InputDecoration(
                        label: Text("Asignaciones"),
                        isDense: true,
                      ),
                      asyncItems: (text) => database
                          .from(VehicleAssignmentEntity.tableName)
                          .select<PostgrestList>(VehicleAssignmentEntity.select)
                          .ilike("users.name", "%$text%")
                          .withConverter((data) => data.map((e) => VehicleAssignmentEntity.fromJson(e)).toList()),
                      itemAsString: (item) => "${item.user.name} [${item.vehicle.code}]",
                      onChanged: (item) {
                        _formKey.currentState?.fields["user"]?.didChange(item?.user);
                        _formKey.currentState?.fields["vehicle"]?.didChange(item?.vehicle);
                        _formKey.currentState?.fields["quantity"]?.didChange(item?.quantity.toStringAsFixed(2));
                      },
                    ),
                  )
                ],
              ),
              vgap(10),
              FormBuilderTextField(
                name: 'note',
                decoration: const InputDecoration(
                  label: Text("Nota"),
                ),
                minLines: 2,
                maxLines: 3,
              ),
              const Divider(),
              Row(children: [
                Flexible(
                  child: FormBuilderSearchableDropdown<UserEntity>(
                    name: 'user',
                    decoration: const InputDecoration(label: Text("Usuario"), isDense: true),
                    asyncItems: (text) => database
                        .from(UserEntity.tableName)
                        .select<PostgrestList>(UserEntity.select)
                        .ilike("name", "%$text%")
                        .withConverter((data) => data.map((e) => UserEntity.fromJson(e)).toList()),
                    compareFn: (item1, item2) => item1 == item2,
                    itemAsString: (item) => item.name,
                    validator: FormBuilderValidators.required(),
                  ),
                ),
                hgap(5),
                Flexible(
                  child: FormBuilderField<VehicleEntity>(
                    name: 'vehicle',
                    validator: FormBuilderValidators.required(),
                    builder: (state) {
                      return DropdownSearch<VehicleEntity>(
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(label: Text("Vehículo"), isDense: true),
                        ),
                        asyncItems: (String filter) async {
                          return database
                              .from(VehicleEntity.tableName)
                              .select<PostgrestList>(VehicleEntity.select)
                              .ilike("name", "%$filter%")
                              .withConverter((data) => data.map((e) => VehicleEntity.fromJson(e)).toList());
                        },
                        compareFn: (a, b) => a == b,
                        itemAsString: (vehicle) => vehicle.name,
                        onChanged: (data) => state.didChange(data),
                      );
                    },
                  ),
                ),
                hgap(5),
                Flexible(
                  child: FormBuilderSearchableDropdown<BettingBankEntity>(
                    name: 'bank',
                    decoration: const InputDecoration(label: Text("Banca"), isDense: true),
                    asyncItems: (text) {
                      return database
                          .from(BettingBankEntity.tableName)
                          .select<PostgrestList>(BettingBankEntity.select)
                          .ilike("name", "%$text%")
                          .withConverter((data) => data.map((e) => BettingBankEntity.fromJson(e)).toList());
                    },
                    compareFn: (item1, item2) => item1 == item2,
                    itemAsString: (item) => item.name,
                  ),
                ),
                hgap(5),
                Flexible(
                  child: FormBuilderTextField(
                    name: 'quantity',
                    decoration: const InputDecoration(label: Text("Galones"), isDense: true),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                    onSubmitted: (_) => _onDetailAdded(context),
                  ),
                ),
                hgap(10),
                IconButton.filledTonal(
                  onPressed: () => _onDetailAdded(context),
                  icon: const Icon(Icons.add),
                ),
              ]),
              const Divider(
                height: 20,
              ),
              Expanded(
                child: _details.watch(
                  (context, state) => Table(
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: context.colorScheme.onBackground.withOpacity(0.1), width: 2),
                          ),
                        ),
                        children: [
                          Padding(padding: p8, child: Text("Usuario", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("Vehiculo", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("Placa", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("Combustible", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("Banca", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("Cantidad", style: context.textTheme.titleMedium)),
                          Padding(padding: p8, child: Text("", style: context.textTheme.titleMedium)),
                        ],
                      ),
                      ...state.map(
                        (detail) => TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: context.colorScheme.onBackground.withOpacity(0.1), width: 2),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: p8,
                              child: Text(detail.user.name, style: context.textTheme.titleMedium),
                            ),
                            Padding(
                              padding: p8,
                              child: Text(detail.vehicle.name, style: context.textTheme.titleMedium),
                            ),
                            Padding(
                              padding: p8,
                              child: Text(detail.vehicle.code, style: context.textTheme.titleMedium),
                            ),
                            Padding(
                              padding: p8,
                              child: Text(detail.fuel.name, style: context.textTheme.titleMedium),
                            ),
                            Padding(
                              padding: p8,
                              child: Text(detail.bettingBank?.name ?? "-", style: context.textTheme.titleMedium),
                            ),
                            Padding(
                              padding: p8,
                              child: Text(detail.quantity.toStringAsFixed(2), style: context.textTheme.titleMedium),
                            ),
                            Center(
                              child: IconButton(
                                onPressed: () => _onRemove(detail),
                                icon: const Icon(Icons.remove),
                                color: context.colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

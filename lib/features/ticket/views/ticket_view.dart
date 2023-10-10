import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fuel_management/core/entities/vehicle_entity.dart';
import 'package:intl/intl.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/ticket_detail_entity.dart';
import '../../../core/entities/ticket_entity.dart';
import '../../../core/extension.dart';
import '../../../core/router.dart';
import '../../../core/services.dart';

@RoutePage()
class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final _pagedController = PagedDataTableController<String, String, TicketEntity>();

  Future<List<TicketDetailEntity>> _getTicketDetails(TicketEntity ticket) => database
      .from(TicketDetailEntity.tableName)
      .select<PostgrestList>(TicketDetailEntity.select)
      .eq(TicketDetailEntity.primaryKey, ticket.id)
      .withConverter<List<TicketDetailEntity>>((data) => data.map((e) => TicketDetailEntity.fromJson(e)).toList());

  Future<void> _onShowDetail(BuildContext context, TicketEntity ticket) => _getTicketDetails(ticket)
      .then((details) => ticket.copyWith(details: details))
      .then((ticketWithDetails) => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => TicketDetailDialog(ticket: ticketWithDetails),
          ));

  Future<void> _onPrint(BuildContext context, TicketEntity ticket) => _getTicketDetails(ticket)
      .then((details) => ticket.copyWith(details: details))
      .then((ticketWithDetails) => printerRepository.printTicket(ticketWithDetails));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => TextButton(
              onPressed: () => router.replace(const TicketFromRoute()),
              child: const Text("Crear Ticket"),
            ),
          ),
          hgap(10),
        ],
      ),
      endDrawer: const Drawer(),
      body: PagedDataTable<String, String, TicketEntity>(
        initialPage: "",
        controller: _pagedController,
        idGetter: (item) => item.code,
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {
          try {
            final builder = database
                .from(TicketEntity.tableName)
                .select<PostgrestListResponse>(TicketEntity.select, const FetchOptions(count: CountOption.exact));

            if (pageToken.isNotEmpty) {
              builder.lt("code", pageToken);
            }

            if (filtering.has("code")) {
              builder.ilike("code", "%${filtering.valueOrNull("code")}%");
            }

            if (filtering.has("date")) {
              builder.eq("created_at_text", DateFormat("yyyy-MM-dd").format(filtering.valueOrNull("date")));
            }

            final PostgrestResponse(:count, :data) = await builder.limit(pageSize).order("code", ascending: false);
            final vehicles = data?.map((e) => TicketEntity.fromJson(e)).toList() ?? [];
            final nextPage = vehicles.length < pageSize ? null : vehicles.last.id;

            return PaginationResult.items(elements: vehicles, size: count, nextPageToken: nextPage);
          } on PostgrestException catch (error) {
            return PaginationResult.error(error: error.message);
          }
        },
        filters: [
          TextTableFilter(
            id: "code",
            title: "Ticket",
            chipFormatter: (text) => "Ticket: $text",
          ),
          DatePickerTableFilter(
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
            id: "date",
            title: "Fecha",
            chipFormatter: (date) => "Fecha: ${DateFormat("dd/MM/yyyy").format(date)}",
          ),
        ],
        columns: [
          TableColumn(
            sizeFactor: null,
            title: 'Número',
            cellBuilder: (ticket) => Text(ticket.code),
          ),
          TableColumn(
            sizeFactor: null,
            title: 'Fecha',
            cellBuilder: (ticket) => Text(DateFormat("dd/MM/yyyy").format(ticket.createdAt)),
          ),
          TableColumn(
            sizeFactor: null,
            title: 'Hora',
            cellBuilder: (ticket) => Text(DateFormat("hh:mm a").format(ticket.createdAt)),
          ),
          TableColumn(
            sizeFactor: null,
            title: 'Usuario',
            cellBuilder: (ticket) => Text(ticket.createdBy.name),
          ),
          DropdownTableColumn(
            sizeFactor: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              fillColor: Colors.transparent,
            ),
            title: "Estado",
            getter: (item) => item.active,
            setter: (item, newValue, rowIndex) => database
                .from(TicketEntity.tableName)
                .update({"active": newValue})
                .eq(TicketEntity.primaryKey, item.id)
                .then((_) => true)
                .onError((_, __) => false),
            items: [
              const DropdownMenuItem(
                value: true,
                child: Text("Activo"),
              ),
              const DropdownMenuItem(
                value: false,
                child: Text("Anulado"),
              ),
            ],
          ),
          TableColumn(
            sizeFactor: null,
            title: 'Acciones',
            cellBuilder: (ticket) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _onShowDetail(context, ticket),
                  color: context.colorScheme.primary,
                  icon: const Icon(Icons.list),
                ),
                IconButton(
                  onPressed: () => _onPrint(context, ticket),
                  color: context.colorScheme.secondary,
                  icon: const Icon(Icons.print),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TicketDetailDialog extends StatelessWidget {
  const TicketDetailDialog({super.key, required this.ticket});

  final TicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        FilledButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar")),
      ],
      title: Center(child: Text(ticket.code)),
      content: SizedBox(
        width: context.appSize.width * 0.8,
        height: context.appSize.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(label: Text("Usuario")),
                      initialValue: ticket.createdBy.name,
                    ),
                  ),
                  hgap(5),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(label: Text("Fecha")),
                      initialValue: DateFormat("dd/MM/yyyy").format(ticket.createdAt),
                    ),
                  ),
                  hgap(5),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(label: Text("Hora")),
                      initialValue: DateFormat("hh:mm a").format(ticket.createdAt),
                    ),
                  ),
                ],
              ),
              vgap(10),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Nota"),
                ),
                minLines: 2,
                maxLines: 3,
                initialValue: ticket.note,
              ),
              vgap(10),
              Table(
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
                      Padding(padding: p8, child: Text("Matricula", style: context.textTheme.titleMedium)),
                      Padding(padding: p8, child: Text("Combustible", style: context.textTheme.titleMedium)),
                      Padding(padding: p8, child: Text("Banca", style: context.textTheme.titleMedium)),
                      Padding(padding: p8, child: Text("Cantidad", style: context.textTheme.titleMedium)),
                    ],
                  ),
                  ...ticket.details.map(
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
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

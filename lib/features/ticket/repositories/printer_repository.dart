import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel_management/core/entities/ticket_detail_entity.dart';
import 'package:fuel_management/features/ticket/repositories/printer_bytegen.dart'; // Asegúrate de que esta importación sea correcta
import 'package:fuel_management/features/ticket/repositories/printer_service.dart';
import 'package:injectable/injectable.dart';

import '../../../core/entities/ticket_entity.dart';

@LazySingleton()
class PrinterRepository {
  Future<void> printTicket(TicketEntity ticket) async {
    debugPrint(jsonEncode(ticket.toJson()));

    Map<String, dynamic> jsonTicket = ticket.toJson();
    TicketBody ticketBody = fromJsonToTicketBody(jsonTicket);
    List<int> bytes = await getTicketBytes(ticketBody);
    await PosPrinterService.instance.printTicket(Future.value(bytes));
  }
}

TicketBody fromJsonToTicketBody(Map<String, dynamic> json) {
  List<DetailEntity> details = [];
  for (var detail in json['details']) {
    TicketDetailEntity ticketDetail = detail;
    // He agregado eso porque he notado que al enviar a imprimir hay campos sin validar y envia el error de String Null. 
    // TODO: Validar campos de Ticket para evitar que se envien vacios. 
    details.add(DetailEntity(
      forUser: ticketDetail.user?.name ?? "",
      roomId: ticketDetail.bettingBank?.name ?? "",
      bettingBankName: ticketDetail.bettingBank?.name ?? "",
      vehicleBrand: ticketDetail.vehicle?.brand?.name ?? "",
      vehicleModel: ticketDetail.vehicle?.model?.name ?? "",
      vehicleCode: ticketDetail.vehicle?.code ?? "",
      vehicleMileage: ticketDetail.vehicle?.kilometres ?? 0,
      fuelQuantity: ticketDetail.quantity?.toDouble() ?? 0.0,
      fuelName: ticketDetail.fuel?.name ?? "",
    ));
  }

  return TicketBody(
    id: json['id'] ?? "",
    createdAt: json['created_at'] ?? "",
    createdBy: json['createdBy']?.name ?? "",
    details: details,
    note: json['note'] ?? "",
    use24HourFormat: true, 
  );
}

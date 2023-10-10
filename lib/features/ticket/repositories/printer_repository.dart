import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/entities/ticket_entity.dart';

@LazySingleton()
class PrinterRepository {
  Future<void> printTicket(TicketEntity ticket) async {
    debugPrint(jsonEncode(ticket.toJson()));
    //TODO: AGREGAR LOGICA PARA IMPRIMIR TICKETS
  }
}

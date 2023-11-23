import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../core/entities/ticket_entity.dart';
import '../../../core/entities/vehicle_entity.dart';

Future<List<int>> convertTicketToBytes({
  required TicketEntity ticket,
  bool use24HourFormat = false,
}) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm58, profile);
  List<int> bytes = [];

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Santo_Domingo'));
  DateTime parsedDate = ticket.createdAt.toLocal();
  initializeDateFormatting('es_DO', null);
  String formattedDate = DateFormat('dd-MM-yy', 'es_DO').format(parsedDate);
  String formattedTime = DateFormat(use24HourFormat ? 'HH:mm' : 'hh:mm a', 'es_DO').format(parsedDate);

  for (final detail in ticket.details) {
    bytes += generator.text('Ticket de Combustible',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('CONSORCIO',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size2));
    bytes += generator.text('La Suerte',
        styles:
            const PosStyles(bold: false, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('Fecha del Documento',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size1));
    bytes += generator.text('Dia: $formattedDate');
    bytes += generator.text('Hora: $formattedTime');
    bytes += generator.feed(1);
    bytes += generator.text('Tipo de Documento',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size1));
    bytes += generator.text('--TICKET DE COMBUSTIBLE--',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.feed(1);
    bytes += generator.text('--DETALLE--------------------------------------',
        styles: const PosStyles(align: PosAlign.left, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.text('Banca: ${detail.bettingBank?.name ?? 'N/A'}');

    bytes += generator.text('Vehiculo: ${detail.vehicle.name}');
    bytes += generator.text('Conductor: ${detail.user.name}');
    bytes += generator.text('Placa: ${detail.vehicle.code}');
    bytes += generator.text('Kilometraje: ${detail.vehicle.kilometres}');
    bytes += generator.text('Total GL: ${detail.quantity}');
    bytes += generator.text('Combustible: ${detail.fuel.name}');
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.feed(1);
    bytes += generator.text('Especificar el Cargo',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.text(ticket.note ?? 'N/A',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.text('Recibido por:',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('-------------------',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('Despachado por:',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('-------------------',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.text(ticket.createdBy.name,
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.text('La Suerte',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(1);
    bytes += generator.text('Gracias por su Compra.',
        styles:
            const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size1, width: PosTextSize.size1));
    bytes += generator.feed(1);
    bytes += generator.cut();
  }

  return bytes;
}

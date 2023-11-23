// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/capability_profile.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/enums.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/generator.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/pos_styles.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TicketBody {
  final String id;
  final String createdAt;
  final String createdBy;
  final List<DetailEntity> details;
  final String note;
  final bool use24HourFormat;

  TicketBody(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.details,
      required this.note,
      required this.use24HourFormat});
}

class DetailEntity {
  final String forUser;
  final String roomId;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleCode;
  final num? vehicleMileage;
  final double fuelQuantity;
  final String fuelName;
  final String bettingBankName;

  DetailEntity({
    required this.forUser,
    required this.roomId,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleCode,
    required this.vehicleMileage,
    required this.fuelQuantity,
    required this.fuelName,
    required this.bettingBankName,
  });
}

Future<List<int>> getTicketBytes(TicketBody ticketEntity) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm58, profile);
  List<int> bytes = [];

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Santo_Domingo'));
  DateTime parsedDate = DateTime.parse(ticketEntity.createdAt).toLocal();
  initializeDateFormatting('es_DO', null);
  String formattedDate = DateFormat('dd-MM-yy', 'es_DO').format(parsedDate);
  String formattedTime =
      DateFormat(ticketEntity.use24HourFormat ? 'HH:mm' : 'hh:mm a', 'es_DO')
          .format(parsedDate);

  for (var detail in ticketEntity.details) {
    bytes += generator.text('Ticket de Combustible',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('CONSORCIO',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size2));
    bytes += generator.text('La Suerte',
        styles: const PosStyles(
            bold: false,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('Fecha del Documento',
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size1));
    bytes += generator.text('Dia: $formattedDate');
    bytes += generator.text('Hora: $formattedTime');
    bytes += generator.feed(1);
    bytes += generator.text('Tipo de Documento',
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size1));
    bytes += generator.text('--TICKET DE COMBUSTIBLE--',
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.feed(1);
    bytes += generator.text('--DETALLE--------------------------------------',
        styles: const PosStyles(
            align: PosAlign.left,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.text('Banca: ${detail.bettingBankName}');

    bytes += generator
        .text('Vehiculo: ${detail.vehicleBrand} - ${detail.vehicleModel}');
    bytes += generator.text('Conductor: ${detail.forUser}');
    bytes += generator.text('Placa: ${detail.vehicleCode}');
    bytes += generator.text('Kilometraje: ${detail.vehicleMileage}');
    bytes += generator.text('Total GL: ${detail.fuelQuantity}');
    bytes += generator.text('Combustible: ${detail.fuelName}');
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.feed(1);
    bytes += generator.text('Especificar el Cargo',
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.text(ticketEntity.note,
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size1));
    bytes += generator.text('-----------------------------------------------');
    bytes += generator.text('Recibido por:',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('-------------------',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('Despachado por:',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(2);
    bytes += generator.text('-------------------',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.text(ticketEntity.createdBy,
        styles: const PosStyles(
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.text('La Suerte',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(1);
    bytes += generator.text('Gracias por su Compra.',
        styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1));
    bytes += generator.feed(1);
    bytes += generator.cut();
  }

  return bytes;
}

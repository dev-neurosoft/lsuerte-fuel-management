import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:injectable/injectable.dart';

import '../../../core/entities/ticket_entity.dart';
import 'ticket_to_bytes_helper.dart';

@LazySingleton()
final class PrinterRepository {
  Future<void> printTicket({
    required TicketEntity ticket,
    required VoidCallback onSuccess,
    required ValueChanged<String> onFailure,
  }) async {
    final availablePrinters = <PrinterDevice>[];
    const steps = 8;

    try {
      for (var i = 0; i < steps; i++) {
        PrinterManager.instance.discovery(type: PrinterType.usb).listen((device) {
          if (device.name != null && device.name!.toUpperCase().contains('POS')) {
            availablePrinters.add(device);
          }
        });

        if (availablePrinters.isNotEmpty) {
          break;
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      if (availablePrinters.isEmpty) {
        onFailure('No se encontraron impresoras.');
        return;
      }

      for (final printer in availablePrinters) {
        bool isConnected = await PrinterManager.instance.connect(
          type: PrinterType.usb,
          model: UsbPrinterInput(
            name: printer.name,
            productId: printer.productId,
            vendorId: printer.vendorId,
          ),
        );

        if (!isConnected) {
          onFailure('No se pudo conectar a la impresora ${printer.name}. Intentando con otra...');
          continue;
        }

        final result = await PrinterManager.instance.send(
          type: PrinterType.usb,
          bytes: await convertTicketToBytes(ticket: ticket),
        );

        if (!result) {
          onFailure('No se pudo imprimir el ticket. Intentando con otra...');
          continue;
        }

        await PrinterManager.instance.disconnect(type: PrinterType.usb);

        onSuccess();
        break;
      }

      if (availablePrinters.isEmpty) {
        onFailure('No se pudo conectar a ninguna impresora.');
      }
    } catch (error) {
      debugPrint(error.toString());
      onFailure("No se pudo imprimir el ticket");
    }
  }
}

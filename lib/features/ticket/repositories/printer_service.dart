// ignore_for_file: avoid_print, unused_element, avoid_init_to_null, depend_on_referenced_packages

import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';

class PosPrinterService {
  PosPrinterService._privateConstructor();

  static final PosPrinterService _instance = PosPrinterService._privateConstructor();

  static PosPrinterService get instance => _instance;

  Future<void> printTicket(Future<List<int>> ticketBytes) async {
    List<PrinterDevice> availablePrinters = await _discoverPrinters();

    if (availablePrinters.isEmpty) {
      print('No se encontraron impresoras.');
      return;
    }

    for (PrinterDevice printer in availablePrinters) {
      bool connected = await _connectDevice(printer, PrinterType.usb);
      if (connected) {
        List<int> ticketBytesData = await ticketBytes;
        PrinterManager.instance.send(type: PrinterType.usb, bytes: ticketBytesData);
        await PrinterManager.instance.disconnect(type: PrinterType.usb);
        print('Impresión exitosa.');
        return;
      } else {
        print('No se pudo conectar a la impresora ${printer.name}. Intentando con otra...');
      }
    }

    print('No se pudo conectar a ninguna impresora.');
  }

  Future<List<PrinterDevice>> _discoverPrinters() async {
    List<PrinterDevice> devices = [];
    bool discoveryComplete = false;

    PrinterManager.instance.discovery(type: PrinterType.usb).listen((device) {
      if (device.name != null && device.name!.toUpperCase().contains('POS')) {
        devices.add(device);
      }
    }).onDone(() {
      discoveryComplete = true;
    });

    while (!discoveryComplete) {
      await Future.delayed(const Duration(seconds: 1));
    }

    return devices;
  }

  Future<bool> _connectDevice(PrinterDevice selectedPrinter, PrinterType type,
      {bool reconnect = false,
      bool isBle = false,
      String? ipAddress = null}) async {
    try {
      await PrinterManager.instance.connect(
        type: type,
        model: UsbPrinterInput(
          name: selectedPrinter.name,
          productId: selectedPrinter.productId,
          vendorId: selectedPrinter.vendorId,
        ),
      );
      return true;
    } catch (e) {
      print('Error al conectar: $e');
      return false;
    }
  }
}

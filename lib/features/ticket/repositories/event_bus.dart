import 'package:event_bus/event_bus.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';

final EventBus bus = EventBus();

class PrinterSelectedEvent {
  final PrinterDevice printer; 
  PrinterSelectedEvent(this.printer);
}


class PrinterDiscoveredEvent {
  final List<PrinterDevice> printers;
  PrinterDiscoveredEvent(this.printers);
}

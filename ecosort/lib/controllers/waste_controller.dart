// File: lib/controllers/waste_controller.dart

import 'package:get/get.dart';
import '../models/waste_entry.dart';

class WasteController extends GetxController {
  var wasteEntries = <WasteEntry>[].obs;

  void addEntry(WasteEntry entry) {
    wasteEntries.add(entry);
  }

  // --> PASTIKAN METHOD INI ADA <--
  void deleteEntry(String id) {
    wasteEntries.removeWhere((entry) => entry.id == id);
  }

  // --> PASTIKAN METHOD INI JUGA ADA <--
  void insertEntry(int index, WasteEntry entry) {
    wasteEntries.insert(index, entry);
  }
}

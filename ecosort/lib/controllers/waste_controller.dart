// File: lib/controllers/waste_controller.dart

import 'package:get/get.dart';
import '../models/waste_entry.dart';

class WasteController extends GetxController {
  var wasteEntries = <WasteEntry>[].obs;

  void addEntry(WasteEntry entry) {
    wasteEntries.add(entry);
  }

  // Method untuk menghapus entri berdasarkan ID
  void deleteEntry(String id) {
    wasteEntries.removeWhere((entry) => entry.id == id);
  }

  // Method untuk menyisipkan kembali entri (untuk fitur undo)
  void insertEntry(int index, WasteEntry entry) {
    wasteEntries.insert(index, entry);
  }
}

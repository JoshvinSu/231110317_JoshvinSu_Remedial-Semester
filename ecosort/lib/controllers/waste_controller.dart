// File: lib/controllers/waste_controller.dart

import 'package:get/get.dart';
import '../models/waste_entry.dart';

class WasteController extends GetxController {
  // Gunakan .obs untuk membuat list ini reaktif
  var wasteEntries = <WasteEntry>[].obs;

  // Method untuk menambahkan data
  void addEntry(WasteEntry entry) {
    wasteEntries.add(entry);
  }

  // TODO: Kamu bisa menambahkan method lain seperti hapus atau edit data di sini
}

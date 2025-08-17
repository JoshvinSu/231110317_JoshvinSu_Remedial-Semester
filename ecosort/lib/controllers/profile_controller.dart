// File: lib/controllers/profile_controller.dart

import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Gunakan Rx<Uint8List?> untuk menyimpan data byte gambar yang reaktif
  var profileImageBytes = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Baca file sebagai bytes dan simpan ke dalam variabel reaktif
      profileImageBytes.value = await pickedFile.readAsBytes();
      if (kDebugMode) {
        print('Image picked and bytes stored successfully.');
      }
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
}

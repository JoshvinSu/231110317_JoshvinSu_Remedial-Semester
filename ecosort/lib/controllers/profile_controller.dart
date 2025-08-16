// File: lib/controllers/profile_controller.dart

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // .obs membuat variabel ini "reaktif"
  var profileImagePath = ''.obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Perbarui path gambar, dan semua UI yang "mendengarkan" akan ikut berubah
      profileImagePath.value = pickedFile.path;
    }
  }

  // Getter untuk memudahkan pengambilan file gambar
  File? get profileImage {
    if (profileImagePath.value.isNotEmpty) {
      return File(profileImagePath.value);
    }
    return null;
  }
}

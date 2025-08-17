import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImageBytes = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
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

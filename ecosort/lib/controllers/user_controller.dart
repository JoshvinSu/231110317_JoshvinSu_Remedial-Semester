// File: lib/controllers/user_controller.dart

import 'package:get/get.dart';

class UserController extends GetxController {
  var userEmail = ''.obs;
  var userName = 'Joshvin Su'.obs; // Nama default awal

  void setEmail(String email) {
    userEmail.value = email;
  }

  void setUserName(String name) {
    if (name.isNotEmpty) {
      userName.value = name;
    }
  }
}

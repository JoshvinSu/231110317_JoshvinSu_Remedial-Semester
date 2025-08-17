import 'package:get/get.dart';

class UserController extends GetxController {
  var userEmail = ''.obs;
  var userName = 'Joshvin Su'.obs;

  void setEmail(String email) {
    userEmail.value = email;
  }

  void setUserName(String name) {
    if (name.isNotEmpty) {
      userName.value = name;
    }
  }
}

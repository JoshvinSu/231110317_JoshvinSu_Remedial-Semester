import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var isNotificationEnabled = true.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;

    if (value) {
      Get.snackbar(
        'Notifikasi Diaktifkan',
        'Anda akan menerima pembaruan dari EcoSort.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    } else {
      Get.snackbar(
        'Notifikasi Dinonaktifkan',
        'Anda tidak akan lagi menerima pembaruan.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    }
  }
}

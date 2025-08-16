// File: lib/controllers/notification_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Gunakan .obs agar nilainya menjadi reaktif
  var isNotificationEnabled = true.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;

    // Menampilkan pesan (snackbar) sesuai dengan status notifikasi
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
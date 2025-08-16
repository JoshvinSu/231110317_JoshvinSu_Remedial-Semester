// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/waste_controller.dart';

void main() {
  // Inisialisasi controller saat aplikasi dimulai
  Get.put(WasteController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan GetMaterialApp agar bisa menggunakan GetX
    return GetMaterialApp(
      title: 'EcoSort',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
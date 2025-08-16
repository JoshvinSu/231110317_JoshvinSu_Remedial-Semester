// File: lib/main.dart

import 'package:ecosort/controllers/rewards_controller.dart';
import 'package:ecosort/controllers/theme_controller.dart';
import 'package:ecosort/utils/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/waste_controller.dart';

void main() {
  Get.put(RewardsController());
  Get.put(WasteController());
  Get.put(ThemeController()); // Inisialisasi ThemeController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp secara otomatis mendengarkan perubahan tema dari Get.changeThemeMode
    return GetMaterialApp(
      title: 'EcoSort',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // themeMode akan dikelola secara internal oleh GetX
      translations: AppTranslations(),
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('en', 'US'),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

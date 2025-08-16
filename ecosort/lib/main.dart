// File: lib/main.dart

import 'package:ecosort/utils/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/waste_controller.dart';

void main() {
  Get.put(WasteController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EcoSort',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      translations: AppTranslations(),
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('en', 'US'),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

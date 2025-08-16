// File: lib/screens/home_screen.dart

import 'package:ecosort/screens/guide_screen.dart';
import 'package:ecosort/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/waste_controller.dart';
import 'add_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final WasteController wasteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard_title'.tr),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text('Pengaturan')),
              const PopupMenuItem(value: 2, child: Text('Tentang Aplikasi')),
            ],
            tooltip: 'Pilihan',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.eco, color: Colors.green[700], size: 40),
                title: Text(
                  'weekly_target'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('items_recycled'.trParams({'count': '7'})),
                trailing: SizedBox(
                  width: 100,
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'waste_history'.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (wasteController.wasteEntries.isEmpty) {
                  return Center(
                    child: Text('no_entries'.tr),
                  );
                }
                return ListView.builder(
                  itemCount: wasteController.wasteEntries.length,
                  itemBuilder: (context, index) {
                    final entry = wasteController.wasteEntries[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.recycling),
                        title: Text(entry.wasteType.tr),
                        subtitle: Text(entry.description),
                        trailing: Text(
                          DateFormat('dd MMM yyyy').format(entry.date),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Catatan Baru',
        onPressed: () {
          Get.to(() => const AddEntryScreen());
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.book), label: 'guide'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'profile'.tr),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.to(() => const GuideScreen());
          } else if (index == 2) {
            Get.to(() => const ProfileScreen());
          }
        },
      ),
    );
  }
}
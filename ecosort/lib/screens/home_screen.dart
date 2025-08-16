// File: lib/screens/home_screen.dart

import 'package:ecosort/screens/guide_screen.dart';
import 'package:ecosort/screens/profile_screen.dart'; // Impor ProfileScreen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/waste_controller.dart';
import 'add_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Panggil controller yang sudah dibuat di main.dart
  final WasteController wasteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (kode AppBar dan body tetap sama)
      appBar: AppBar(
        title: const Text('EcoSort Dashboard'),
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
                title: const Text(
                  'Target Daur Ulang Mingguan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('7 dari 10 item telah didaur ulang'),
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
            const Text(
              'Riwayat Catatan Sampah',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (wasteController.wasteEntries.isEmpty) {
                  return const Center(
                    child: Text('Belum ada catatan. Tambahkan sekarang!'),
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
                        title: Text(entry.wasteType),
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
      // POKOK PEMBAHASAN: Navigasi (BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Panduan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.to(() => const GuideScreen());
          } else if (index == 2) {
            // Tambahkan kondisi ini
            Get.to(() => const ProfileScreen());
          }
        },
      ),
    );
  }
}

// File: lib/screens/home_screen.dart

import 'package:ecosort/screens/guide_screen.dart';
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
      // POKOK PEMBAHASAN: AppBar
      appBar: AppBar(
        title: const Text('EcoSort Dashboard'),
        // POKOK PEMBAHASAN: Overflow Menu
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
        // POKOK PEMBAHASAN: Layouts (Column)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // POKOK PEMBAHASAN: Card, ListTile
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.eco, color: Colors.green[700], size: 40),
                title: const Text(
                  'Target Daur Ulang Mingguan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('7 dari 10 item telah didaur ulang'),
                // POKOK PEMBAHASAN: Objek Tambahan (ProgressIndicator)
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
            // Widget ini akan otomatis update jika ada data baru di controller
            Expanded(
              // POKOK PEMBAHASAN: State Manager (GetX)
              child: Obx(() {
                if (wasteController.wasteEntries.isEmpty) {
                  return const Center(
                    child: Text('Belum ada catatan. Tambahkan sekarang!'),
                  );
                }
                // POKOK PEMBAHASAN: ListView, Card, ListTile
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
                          // POKOK PEMBAHASAN: Adding Package (intl)
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
      // POKOK PEMBAHASAN: FAB (FloatingActionButton)
      floatingActionButton: FloatingActionButton(
        // POKOK PEMBAHASAN: Objek Tambahan (ToolTip)
        tooltip: 'Tambah Catatan Baru',
        onPressed: () {
          // Pindah ke halaman tambah data
          Get.to(() => AddEntryScreen());
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
          // TODO: Implementasi navigasi untuk item lain.
          // Contoh, jika index 1 ditekan, pindah ke GuideScreen
          if (index == 1) {
            Get.to(() => GuideScreen());
          }
        },
      ),
    );
  }
}

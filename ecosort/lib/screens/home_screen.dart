// File: lib/screens/home_screen.dart

import 'package:ecosort/screens/about_screen.dart';
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
            onSelected: (value) {
              if (value == 1) {
                Get.to(() => const ProfileScreen());
              } else if (value == 2) {
                Get.to(() => const AboutScreen());
              }
            },
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'weekly_target'.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Text(
                        'items_recycled'.trParams({
                          'count': wasteController.wasteEntries.length
                              .toString(),
                        }),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => LinearProgressIndicator(
                        value: wasteController.wasteEntries.length / 10,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'leaderboard'.tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Dummy Leaderboard
                    ListTile(
                      leading: const Icon(
                        Icons.emoji_events,
                        color: Colors.amber,
                      ),
                      title: const Text('User A'),
                      trailing: Text('15 ${'items'.tr}'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.military_tech,
                        color: Colors.grey,
                      ),
                      title: const Text('User B'),
                      trailing: Text('12 ${'items'.tr}'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.military_tech,
                        color: Colors.brown,
                      ),
                      title: const Text('You'),
                      trailing: Obx(
                        () => Text(
                          '${wasteController.wasteEntries.length} ${'items'.tr}',
                        ),
                      ),
                    ),
                  ],
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
                  return Center(child: Text('no_entries'.tr));
                }
                return ListView.builder(
                  itemCount: wasteController.wasteEntries.length,
                  itemBuilder: (context, index) {
                    final entry = wasteController.wasteEntries[index];
                    return Dismissible(
                      key: Key(entry.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        final deletedEntry = entry;
                        final entryIndex = index;

                        wasteController.deleteEntry(deletedEntry.id);

                        Get.snackbar(
                          'Catatan Dihapus',
                          'Riwayat "${deletedEntry.description}" telah dihapus.',
                          snackPosition: SnackPosition.BOTTOM,
                          mainButton: TextButton(
                            child: const Text(
                              'URUNGKAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              wasteController.insertEntry(
                                entryIndex,
                                deletedEntry,
                              );
                              if (Get.isSnackbarOpen) {
                                Get.back();
                              }
                            },
                          ),
                          duration: const Duration(seconds: 4),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          leading: const Icon(Icons.recycling),
                          title: Text(entry.wasteType.tr),
                          subtitle: Text(entry.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat('dd MMM yyyy').format(entry.date),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: "Konfirmasi Hapus",
                                    middleText:
                                        "Apakah Anda yakin ingin menghapus riwayat \"${entry.description}\"?",
                                    textConfirm: "Hapus",
                                    textCancel: "Batal",
                                    confirmTextColor: Colors.white,
                                    onConfirm: () {
                                      wasteController.deleteEntry(entry.id);
                                      Get.back(); // Close the dialog
                                      Get.snackbar(
                                        'Berhasil',
                                        'Riwayat "${entry.description}" telah dihapus.',
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
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
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: 'guide'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr,
          ),
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

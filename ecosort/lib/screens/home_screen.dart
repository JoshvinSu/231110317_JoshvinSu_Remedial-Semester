import 'dart:async';
import 'package:ecosort/controllers/profile_controller.dart';
import 'package:ecosort/controllers/user_controller.dart';
import 'package:ecosort/screens/about_screen.dart';
import 'package:ecosort/screens/community_screen.dart';
import 'package:ecosort/screens/education_screen.dart';
import 'package:ecosort/screens/profile_screen.dart';
import 'package:ecosort/screens/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/waste_controller.dart';
import 'add_entry_screen.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now().toUtc().add(const Duration(hours: 7));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _updateTime(),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateTime.now().toUtc().add(const Duration(hours: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm:ss').format(_currentTime);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          '$formattedTime WIB',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenContent(),
    EducationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard_title'.tr),
        elevation: 4.0,
        shadowColor: Colors.black.withOpacity(0.2),
        actions: const [DigitalClock()],
      ),
      drawer: const AppDrawer(), // Drawer dipisahkan agar lebih rapi
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              tooltip: 'Tambah Catatan Baru',
              onPressed: () {
                Get.to(() => const AddEntryScreen());
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

// Widget untuk isi konten HomeScreen
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final WasteController wasteController = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.2),
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
                        'count': wasteController.wasteEntries.length.toString(),
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
                            Text(DateFormat('dd MMM yyyy').format(entry.date)),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
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
                                    Get.back();
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
    );
  }
}

// Widget untuk Drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    final UserController userController = Get.find();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Obx(() {
            final imageBytes = profileController.profileImageBytes.value;
            return UserAccountsDrawerHeader(
              accountName: Text(userController.userName.value),
              accountEmail: Text(userController.userEmail.value),
              currentAccountPicture: CircleAvatar(
                backgroundImage: imageBytes != null
                    ? MemoryImage(imageBytes)
                    : const NetworkImage('https://i.pravatar.cc/150?img=3')
                          as ImageProvider,
              ),
              decoration: const BoxDecoration(color: Colors.green),
            );
          }),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Hadiah Saya'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const RewardsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Komunitas'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const CommunityScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const AboutScreen());
            },
          ),
        ],
      ),
    );
  }
}

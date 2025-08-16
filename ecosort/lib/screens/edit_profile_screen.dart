// File: lib/screens/edit_profile_screen.dart

import 'package:ecosort/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan Get.find() untuk mendapatkan instance controller yang sudah ada
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Cukup kembali ke halaman sebelumnya.
              // Perubahan gambar sudah tersimpan di controller.
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Bungkus dengan Obx agar UI di sini juga ikut berubah
            Obx(() {
              final imageFile = controller.profileImage;
              return GestureDetector(
                onTap: () {
                  controller.pickImage();
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile)
                      : const NetworkImage('https://i.pravatar.cc/150?img=3')
                          as ImageProvider,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.pickImage();
              },
              child: const Text('Pilih Gambar dari Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}
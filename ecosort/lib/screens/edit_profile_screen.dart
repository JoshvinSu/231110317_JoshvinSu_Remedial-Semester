import 'package:ecosort/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              final imageBytes = controller.profileImageBytes.value;
              return GestureDetector(
                onTap: () {
                  controller.pickImage();
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: imageBytes != null
                      ? MemoryImage(imageBytes)
                      : const NetworkImage('https://i.pravatar.cc/150?img=3')
                          as ImageProvider,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 20, color: Colors.black),
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
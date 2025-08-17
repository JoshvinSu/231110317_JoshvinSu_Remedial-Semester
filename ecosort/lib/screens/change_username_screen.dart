// File: lib/screens/change_username_screen.dart

import 'package:ecosort/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeUsernameScreen extends StatelessWidget {
  const ChangeUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final TextEditingController nameController =
        TextEditingController(text: userController.userName.value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Username Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                userController.setUserName(nameController.text);
                Get.back();
                Get.snackbar(
                  'Berhasil',
                  'Username berhasil diubah!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
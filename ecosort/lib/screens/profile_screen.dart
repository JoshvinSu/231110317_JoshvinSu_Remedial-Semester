// File: lib/screens/profile_screen.dart

import 'dart:io';
import 'package:ecosort/controllers/notification_controller.dart';
import 'package:ecosort/controllers/profile_controller.dart';
import 'package:ecosort/controllers/theme_controller.dart';
import 'package:ecosort/controllers/user_controller.dart';
import 'package:ecosort/screens/change_password_screen.dart';
import 'package:ecosort/screens/change_username_screen.dart';
import 'package:ecosort/screens/edit_profile_screen.dart';
import 'package:ecosort/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final NotificationController notificationController =
        Get.put(NotificationController());
    final ThemeController themeController = Get.find();
    final UserController userController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr)),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              Obx(() {
                final imageFile = profileController.profileImage;
                return GestureDetector(
                  onTap: () => Get.to(() => const EditProfileScreen()),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: imageFile != null
                        ? FileImage(imageFile)
                        : const NetworkImage('https://i.pravatar.cc/150?img=3')
                            as ImageProvider,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.edit, size: 15, color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  userController.userName.value,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Text(
                  userController.userEmail.value,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Ganti Username'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const ChangeUsernameScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: Text('edit_profile'.tr),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const EditProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: Text('change_password'.tr),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const ChangePasswordScreen());
            },
          ),
          Obx(
            () => ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('notifications'.tr),
              trailing: Switch(
                value: notificationController.isNotificationEnabled.value,
                onChanged: (value) {
                  notificationController.toggleNotification(value);
                },
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('language'.tr),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          Obx(
            () => ListTile(
              leading: Icon(
                themeController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              title: const Text('Mode Gelap'),
              trailing: Switch(
                value: themeController.isDarkMode.value,
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text('logout'.tr, style: const TextStyle(color: Colors.red)),
            onTap: () {
              Get.offAll(() => const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}

void _showLanguageDialog(BuildContext context) {
  Get.defaultDialog(
    title: 'Pilih Bahasa',
    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Bahasa Indonesia'),
          onTap: () {
            Get.updateLocale(const Locale('id', 'ID'));
            Get.back();
          },
        ),
        ListTile(
          title: const Text('English'),
          onTap: () {
            Get.updateLocale(const Locale('en', 'US'));
            Get.back();
          },
        ),
      ],
    ),
  );
}
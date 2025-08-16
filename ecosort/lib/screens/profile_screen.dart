// File: lib/screens/profile_screen.dart

import 'dart:io';
import 'package:ecosort/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          // Bagian Header Profil
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
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
              ),
              const SizedBox(height: 10),
              const Text(
                'Joshvin Su',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'joshvinsu@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),

          // Menu Pengaturan (tetap sama)
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profil'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final result = await Get.to(() => EditProfileScreen(
                    profileImage: _profileImage,
                  ));
              if (result != null) {
                setState(() {
                  _profileImage = result;
                });
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ganti Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            trailing: Switch(value: true, onChanged: (bool value) {}),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
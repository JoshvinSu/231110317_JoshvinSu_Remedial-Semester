// File: lib/screens/edit_profile_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final File? profileImage;

  const EditProfileScreen({super.key, this.profileImage});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _profileImage = widget.profileImage;
  }

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
      appBar: AppBar(
        title: const Text('Edit Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Get.back(result: _profileImage);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pilih Gambar dari Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}
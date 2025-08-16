// File: lib/screens/guide_screen.dart

import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Daur Ulang'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          // TODO: Isi halaman ini dengan konten panduan daur ulang.
          // Kamu bisa menggunakan ListView dengan Card untuk menampilkan daftar panduan.
          child: Text(
            'Halaman ini akan berisi informasi tentang cara memilah dan mendaur ulang sampah plastik, kertas, dan organik.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
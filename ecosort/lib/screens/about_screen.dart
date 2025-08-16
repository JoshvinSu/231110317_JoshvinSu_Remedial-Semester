import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EcoSort',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Versi 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'EcoSort adalah aplikasi yang membantu Anda untuk mengelola dan memilah sampah dengan lebih baik. Dengan fitur pencatatan riwayat sampah, Anda dapat melacak jenis dan jumlah sampah yang Anda hasilkan, serta melihat statistik untuk setiap kategori sampah (organik, plastik, dan kertas).',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi ini dibuat untuk memenuhi tugas Remedial Semester.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

// File: lib/screens/education_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edukasi Daur Ulang')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          EducationCard(
            title: 'Membuat Kompos dari Sampah Organik',
            content:
                'Sampah organik seperti sisa makanan dan daun kering bisa diolah menjadi kompos yang subur untuk tanaman. Caranya mudah, cukup sediakan wadah tertutup dengan lubang udara, lalu masukkan sampah organik secara berlapis dengan tanah atau serbuk gergaji.',
            icon: Icons.eco,
            color: Colors.green,
          ),
          SizedBox(height: 16),
          EducationCard(
            title: 'Ide Kreatif Daur Ulang Botol Plastik',
            content:
                'Jangan buang botol plastikmu! Kamu bisa mengubahnya menjadi pot bunga, tempat pensil, atau bahkan mainan. Cukup potong, hias, dan kreasikan sesuai imajinasimu.',
            icon: Icons.lightbulb_outline,
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          EducationCard(
            title: 'Dampak Positif Daur Ulang',
            content:
                'Setiap sampah yang kamu daur ulang membantu mengurangi penumpukan di TPA, menghemat energi, dan menjaga kelestarian sumber daya alam. Teruslah memilah, karena setiap langkah kecilmu berarti besar bagi bumi.',
            icon: Icons.public,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const EducationCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

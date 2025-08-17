// File: lib/screens/education_screen.dart

import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pusat Edukasi Daur Ulang'),
      //   elevation: 2.0,
      // ), // <-- BARIS INI DIHAPUS
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Kenali Prinsip 3R',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Konsep sederhana untuk mengelola sampah dan menjaga lingkungan.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // --- Kategori 3R dengan Ikon ---
          const EducationCategory(
            title: 'Reduce (Kurangi)',
            description:
                'Langkah pertama dan terpenting adalah mengurangi jumlah sampah yang kita hasilkan.',
            icon: Icons.shopping_bag_outlined, // Ikon untuk Reduce
            iconColor: Colors.red,
            points: [
              'Gunakan tas belanja kain daripada kantong plastik.',
              'Pilih produk dengan kemasan minimal atau tanpa kemasan.',
              'Bawa botol minum dan tempat makan sendiri.',
            ],
          ),
          const SizedBox(height: 24),
          const EducationCategory(
            title: 'Reuse (Gunakan Kembali)',
            description:
                'Memberi kehidupan kedua pada barang-barang sebelum membuangnya.',
            icon: Icons.style_outlined, // Ikon untuk Reuse
            iconColor: Colors.blue,
            points: [
              'Ubah botol plastik atau kaleng bekas menjadi pot tanaman.',
              'Gunakan kembali toples kaca untuk menyimpan bumbu dapur.',
              'Donasikan pakaian atau barang yang masih layak pakai.',
            ],
          ),
          const SizedBox(height: 24),
          const EducationCategory(
            title: 'Recycle (Daur Ulang)',
            description:
                'Mengolah kembali sampah menjadi produk baru yang bermanfaat.',
            icon: Icons.recycling_outlined, // Ikon untuk Recycle
            iconColor: Colors.green,
            points: [
              'Pisahkan sampah sesuai jenisnya: organik, plastik, kertas, dan kaca.',
              'Pastikan sampah anorganik (plastik, kertas) dalam keadaan bersih dan kering.',
              'Setor sampah yang sudah dipilah ke bank sampah terdekat.',
            ],
          ),
          const Divider(height: 40, thickness: 1),

          // --- Fakta Menarik ---
          const Text(
            'Fakta Menarik Daur Ulang',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const FactCard(
            fact:
                'Mendaur ulang 1 ton kertas dapat menyelamatkan sekitar 17 pohon besar.',
            icon: Icons.forest,
            color: Colors.green,
          ),
          const SizedBox(height: 12),
          const FactCard(
            fact:
                'Dibutuhkan waktu hingga 450 tahun bagi satu botol plastik untuk terurai di alam.',
            icon: Icons.hourglass_bottom,
            color: Colors.blue,
          ),
          const SizedBox(height: 12),
          const FactCard(
            fact:
                'Energi yang dihemat dari mendaur ulang satu kaleng aluminium bisa menyalakan TV selama 3 jam.',
            icon: Icons.tv,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

// --- Widget Kustom untuk Kategori (sudah diubah untuk menggunakan Ikon) ---
class EducationCategory extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final List<String> points;

  const EducationCategory({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: iconColor,
                ), // Menggunakan Ikon di sini
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...points.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Text(point)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Widget Kustom untuk Fakta ---
class FactCard extends StatelessWidget {
  final String fact;
  final IconData icon;
  final Color color;

  const FactCard({
    super.key,
    required this.fact,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              fact,
              style: const TextStyle(fontSize: 15, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

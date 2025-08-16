// File: lib/utils/app_translations.dart

import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'id_ID': {
      // General
      'save': 'Simpan',
      'choose_image': 'Pilih Gambar dari Galeri',
      'error': 'Error',
      'success': 'Berhasil',

      // Home Screen
      'dashboard_title': 'EcoSort Dashboard',
      'weekly_target': 'Target Daur Ulang Mingguan',
      'items_recycled': '@count dari 10 item telah didaur ulang',
      'waste_history': 'Riwayat Catatan Sampah',
      'no_entries': 'Belum ada catatan. Tambahkan sekarang!',
      'home': 'Home',
      'guide': 'Panduan',
      'profile': 'Profil',
      'recycling_race': 'Lomba Daur Ulang',
      'recycling_progress':
          'Kemajuan Daur Ulang: @count item telah didaur ulang',
      'leaderboard': 'Papan Peringkat',
      'items': 'item',

      // Add Entry Screen
      'add_entry_title': 'Tambah Catatan Sampah',
      'choose_waste_type': 'Pilih Jenis Sampah:',
      'plastic': 'Plastik',
      'paper': 'Kertas',
      'organic': 'Organik',
      'description_hint': 'Deskripsi / Berat Sampah',
      'date': 'Tanggal',
      'choose_date': 'Pilih Tanggal',
      'add_success_message': 'Catatan sampah berhasil ditambahkan!',

      // Profile Screen
      'edit_profile': 'Edit Profil',
      'change_password': 'Ganti Password',
      'notifications': 'Notifikasi',
      'language': 'Bahasa',
      'logout': 'Logout',

      // Edit Profile Screen
      'edit_profile_title': 'Edit Profil',

      // Change Password Screen
      'change_password_title': 'Ganti Password',
      'old_password': 'Password Lama',
      'new_password': 'Password Baru',
      'confirm_new_password': 'Konfirmasi Password Baru',
      'password_changed_success': 'Password berhasil diubah!',
      'password_mismatch': 'Password baru dan konfirmasi tidak cocok',
      'fill_all_fields': 'Semua field harus diisi',

      // Guide Screen
      'guide_title': 'Panduan Daur Ulang',
      'organic_waste': 'Sampah Organik',
      'what_includes': 'Apa saja yang termasuk?',
      'what_not_includes': 'Apa yang tidak termasuk?',
      'organic_includes': 'Sisa makanan, daun kering, sayuran, buah-buahan.',
      'organic_not_includes': 'Plastik, kaleng, kaca, bahan kimia.',
      'plastic_waste': 'Sampah Plastik',
      'plastic_includes': 'Botol plastik, kemasan makanan, tas kresek.',
      'plastic_not_includes': 'Kertas, sisa makanan, baterai.',
      'paper_waste': 'Sampah Kertas',
      'paper_includes': 'Koran, majalah, kardus, kertas HVS.',
      'paper_not_includes':
          'Kertas thermal (struk), kertas berminyak, tisu bekas.',
    },
    'en_US': {
      // General
      'save': 'Save',
      'choose_image': 'Choose Image from Gallery',
      'error': 'Error',
      'success': 'Success',

      // Home Screen
      'dashboard_title': 'EcoSort Dashboard',
      'weekly_target': 'Weekly Recycling Target',
      'items_recycled': '@count of 10 items have been recycled',
      'waste_history': 'Waste Entry History',
      'no_entries': 'No entries yet. Add one now!',
      'home': 'Home',
      'guide': 'Guide',
      'profile': 'Profile',
      'recycling_race': 'Recycling Race',
      'recycling_progress':
          'Recycling Progress: @count items have been recycled',
      'leaderboard': 'Leaderboard',
      'items': 'items',

      // Add Entry Screen
      'add_entry_title': 'Add Waste Entry',
      'choose_waste_type': 'Choose Waste Type:',
      'plastic': 'Plastic',
      'paper': 'Paper',
      'organic': 'Organic',
      'description_hint': 'Description / Weight of Waste',
      'date': 'Date',
      'choose_date': 'Choose Date',
      'add_success_message': 'Waste entry added successfully!',

      // Profile Screen
      'edit_profile': 'Edit Profile',
      'change_password': 'Change Password',
      'notifications': 'Notifications',
      'language': 'Language',
      'logout': 'Logout',

      // Edit Profile Screen
      'edit_profile_title': 'Edit Profile',

      // Change Password Screen
      'change_password_title': 'Change Password',
      'old_password': 'Old Password',
      'new_password': 'New Password',
      'confirm_new_password': 'Confirm New Password',
      'password_changed_success': 'Password changed successfully!',
      'password_mismatch': 'New password and confirmation do not match',
      'fill_all_fields': 'All fields must be filled',

      // Guide Screen
      'guide_title': 'Recycling Guide',
      'organic_waste': 'Organic Waste',
      'what_includes': 'What is included?',
      'what_not_includes': 'What is not included?',
      'organic_includes': 'Food scraps, dry leaves, vegetables, fruits.',
      'organic_not_includes': 'Plastic, cans, glass, chemicals.',
      'plastic_waste': 'Plastic Waste',
      'plastic_includes': 'Plastic bottles, food packaging, plastic bags.',
      'plastic_not_includes': 'Paper, food scraps, batteries.',
      'paper_waste': 'Paper Waste',
      'paper_includes': 'Newspapers, magazines, cardboard, office paper.',
      'paper_not_includes':
          'Thermal paper (receipts), oily paper, used tissues.',
    },
  };
}

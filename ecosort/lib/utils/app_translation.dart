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

      // Login Screen
      'welcome_back': 'Selamat Datang Kembali!',
      'email_empty': 'Email tidak boleh kosong',
      'email_invalid': 'Email harus menggunakan @gmail.com',
      'password_empty': 'Password tidak boleh kosong',
      'login': 'Login',
      'no_account': 'Belum punya akun? Daftar di sini',

      // Signup Screen
      'register': 'Daftar',
      'create_account': 'Buat Akun Baru',
      'full_name': 'Nama Lengkap',
      'name_empty': 'Nama tidak boleh kosong',
      'password': 'Password',
      'already_have_account': 'Sudah punya akun? Login',
      'register_success_title': 'Berhasil!',
      'register_success_message': 'Akun Anda telah berhasil dibuat.',

      // Home Screen
      'dashboard_title': 'EcoSort Dashboard',
      'weekly_target': 'Target Daur Ulang Mingguan',
      'items_recycled': '@count dari 10 item telah didaur ulang',
      'waste_history': 'Riwayat Catatan Sampah',
      'no_entries': 'Belum ada catatan. Tambahkan sekarang!',
      'home': 'Home',
      'education': 'Edukasi',
      'profile': 'Profil',
      'recycling_race': 'Lomba Daur Ulang',
      'recycling_progress':
          'Kemajuan Daur Ulang: @count item telah didaur ulang',
      'leaderboard': 'Papan Peringkat',
      'items': 'item',
      'add_new_entry_tooltip': 'Tambah Catatan Baru',
      'user_a': 'User A',
      'user_b': 'User B',
      'you': 'Anda',
      'undo': 'URUNGKAN',
      'delete_confirmation': 'Konfirmasi Hapus',
      'delete_confirmation_message':
          'Apakah Anda yakin ingin menghapus riwayat "@description"?',
      'delete': 'Hapus',
      'cancel': 'Batal',
      'entry_deleted_success': 'Riwayat "@description" telah dihapus.',
      'settings': 'Pengaturan',
      'my_rewards': 'Hadiah Saya',
      'community': 'Komunitas',
      'about_app': 'Tentang Aplikasi',

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
      'change_username': 'Ganti Username',
      'change_password': 'Ganti Password',
      'notifications': 'Notifikasi',
      'language': 'Bahasa',
      'dark_mode': 'Mode Gelap',
      'logout': 'Logout',
      'choose_language': 'Pilih Bahasa',
      'indonesian': 'Bahasa Indonesia',
      'english': 'English',

      // Edit Profile Screen
      'edit_profile_title': 'Edit Profil',

      // Change Username Screen
      'change_username_title': 'Ganti Username',
      'new_username': 'Username Baru',
      'username_changed_success': 'Username berhasil diubah!',

      // Change Password Screen
      'change_password_title': 'Ganti Password',
      'old_password': 'Password Lama',
      'new_password': 'Password Baru',
      'confirm_new_password': 'Konfirmasi Password Baru',
      'save_changes': 'Simpan Perubahan',
      'password_changed_success': 'Password berhasil diubah!',
      'password_mismatch': 'Password baru dan konfirmasi tidak cocok',
      'fill_all_fields': 'Semua field harus diisi',

      // Education Screen
      'education_center_title': 'Pusat Edukasi Daur Ulang',
      'know_3r': 'Kenali Prinsip 3R',
      'simple_concept':
          'Konsep sederhana untuk mengelola sampah dan menjaga lingkungan.',
      'reduce': 'Reduce (Kurangi)',
      'reduce_desc':
          'Langkah pertama dan terpenting adalah mengurangi jumlah sampah yang kita hasilkan.',
      'reduce_point1': 'Gunakan tas belanja kain daripada kantong plastik.',
      'reduce_point2':
          'Pilih produk dengan kemasan minimal atau tanpa kemasan.',
      'reduce_point3': 'Bawa botol minum dan tempat makan sendiri.',
      'reuse': 'Reuse (Gunakan Kembali)',
      'reuse_desc':
          'Memberi kehidupan kedua pada barang-barang sebelum membuangnya.',
      'reuse_point1':
          'Ubah botol plastik atau kaleng bekas menjadi pot tanaman.',
      'reuse_point2':
          'Gunakan kembali toples kaca untuk menyimpan bumbu dapur.',
      'reuse_point3': 'Donasikan pakaian atau barang yang masih layak pakai.',
      'recycle': 'Recycle (Daur Ulang)',
      'recycle_desc':
          'Mengolah kembali sampah menjadi produk baru yang bermanfaat.',
      'recycle_point1':
          'Pisahkan sampah sesuai jenisnya: organik, plastik, kertas, dan kaca.',
      'recycle_point2':
          'Pastikan sampah anorganik (plastik, kertas) dalam keadaan bersih dan kering.',
      'recycle_point3':
          'Setor sampah yang sudah dipilah ke bank sampah terdekat.',
      'interesting_facts': 'Fakta Menarik Daur Ulang',
      'fact1':
          'Mendaur ulang 1 ton kertas dapat menyelamatkan sekitar 17 pohon besar.',
      'fact2':
          'Dibutuhkan waktu hingga 450 tahun bagi satu botol plastik untuk terurai di alam.',
      'fact3':
          'Energi yang dihemat dari mendaur ulang satu kaleng aluminium bisa menyalakan TV selama 3 jam.',

      // Rewards Screen
      'rewards_title': 'Hadiah Saya',
      'claimed': 'Sudah Diklaim',
      'claim': 'Klaim',
      'recycling_hero': 'Pahlawan Daur Ulang',
      'recycling_hero_desc': 'Berhasil mencapai target 10 item!',
      'environment_champion': 'Juara Lingkungan',
      'environment_champion_desc': 'Berhasil mencapai target 25 item!',
      'ecosort_legend': 'Legenda EcoSort',
      'ecosort_legend_desc': 'Berhasil mencapai target 50 item!',
      'congratulations': 'Selamat!',
      'new_reward_unlocked': 'Anda telah membuka hadiah baru:\n"@reward"',
      'view_reward': 'Lihat Hadiah',
      'close': 'Tutup',
      'your_voucher': 'Voucher Anda!',
      'voucher_desc': 'Gunakan kode di bawah ini untuk menukarkan hadiah Anda:',
      'copy_code': 'Salin Kode',
      'copied': 'Tersalin!',
      'voucher_copied': 'Kode voucher telah disalin.',

      // Community Screen
      'community_title': 'Komunitas EcoSort',
      'community_soon': 'Fitur Komunitas Segera Hadir!',
      'community_desc':
          'Nantikan fitur di mana kamu bisa membuat tim, berkompetisi, dan berbagi pencapaian daur ulangmu dengan teman-teman!',

      // About Screen
      'about_title': 'Tentang Aplikasi',
      'version': 'Versi 1.0.0',
      'about_desc':
          'EcoSort adalah aplikasi mobile yang dirancang untuk membantu pengguna dalam mengelola dan memilah sampah sehari-hari dengan lebih efisien dan menyenangkan. Aplikasi ini bertujuan untuk meningkatkan kesadaran lingkungan dan mendorong praktik daur ulang.',
      'created_by':
          'Aplikasi ini dibuat oleh Joshvin Su (231110317) untuk memenuhi tugas Remedial Semester.',

      // Notification Controller
      'notification_enabled': 'Notifikasi Diaktifkan',
      'notification_enabled_desc': 'Anda akan menerima pembaruan dari EcoSort.',
      'notification_disabled': 'Notifikasi Dinonaktifkan',
      'notification_disabled_desc': 'Anda tidak akan lagi menerima pembaruan.',
    },
    'en_US': {
      // General
      'save': 'Save',
      'choose_image': 'Choose Image from Gallery',
      'error': 'Error',
      'success': 'Success',

      // Login Screen
      'welcome_back': 'Welcome Back!',
      'email_empty': 'Email cannot be empty',
      'email_invalid': 'Email must use @gmail.com',
      'password_empty': 'Password cannot be empty',
      'login': 'Login',
      'no_account': "Don't have an account? Sign up here",

      // Signup Screen
      'register': 'Sign Up',
      'create_account': 'Create a New Account',
      'full_name': 'Full Name',
      'name_empty': 'Name cannot be empty',
      'password': 'Password',
      'already_have_account': 'Already have an account? Login',
      'register_success_title': 'Success!',
      'register_success_message': 'Your account has been created successfully.',

      // Home Screen
      'dashboard_title': 'EcoSort Dashboard',
      'weekly_target': 'Weekly Recycling Target',
      'items_recycled': '@count of 10 items have been recycled',
      'waste_history': 'Waste Entry History',
      'no_entries': 'No entries yet. Add one now!',
      'home': 'Home',
      'education': 'Education',
      'profile': 'Profile',
      'recycling_race': 'Recycling Race',
      'recycling_progress':
          'Recycling Progress: @count items have been recycled',
      'leaderboard': 'Leaderboard',
      'items': 'items',
      'add_new_entry_tooltip': 'Add New Entry',
      'user_a': 'User A',
      'user_b': 'User B',
      'you': 'You',
      'undo': 'UNDO',
      'delete_confirmation': 'Delete Confirmation',
      'delete_confirmation_message':
          'Are you sure you want to delete the entry "@description"?',
      'delete': 'Delete',
      'cancel': 'Cancel',
      'entry_deleted_success': 'Entry "@description" has been deleted.',
      'settings': 'Settings',
      'my_rewards': 'My Rewards',
      'community': 'Community',
      'about_app': 'About App',

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
      'change_username': 'Change Username',
      'change_password': 'Change Password',
      'notifications': 'Notifications',
      'language': 'Language',
      'dark_mode': 'Dark Mode',
      'logout': 'Logout',
      'choose_language': 'Choose Language',
      'indonesian': 'Indonesian',
      'english': 'English',

      // Edit Profile Screen
      'edit_profile_title': 'Edit Profile',

      // Change Username Screen
      'change_username_title': 'Change Username',
      'new_username': 'New Username',
      'username_changed_success': 'Username changed successfully!',

      // Change Password Screen
      'change_password_title': 'Change Password',
      'old_password': 'Old Password',
      'new_password': 'New Password',
      'confirm_new_password': 'Confirm New Password',
      'save_changes': 'Save Changes',
      'password_changed_success': 'Password changed successfully!',
      'password_mismatch': 'New password and confirmation do not match',
      'fill_all_fields': 'All fields must be filled',

      // Education Screen
      'education_center_title': 'Recycling Education Center',
      'know_3r': 'Know the 3R Principles',
      'simple_concept':
          'A simple concept for managing waste and protecting the environment.',
      'reduce': 'Reduce',
      'reduce_desc':
          'The first and most important step is to reduce the amount of waste we generate.',
      'reduce_point1': 'Use a cloth shopping bag instead of plastic bags.',
      'reduce_point2': 'Choose products with minimal or no packaging.',
      'reduce_point3': 'Bring your own water bottle and food container.',
      'reuse': 'Reuse',
      'reuse_desc': 'Giving items a second life before throwing them away.',
      'reuse_point1': 'Turn used plastic bottles or cans into plant pots.',
      'reuse_point2': 'Reuse glass jars to store kitchen spices.',
      'reuse_point3':
          'Donate clothes or items that are still in good condition.',
      'recycle': 'Recycle',
      'recycle_desc': 'Processing waste into new, useful products.',
      'recycle_point1':
          'Separate waste according to its type: organic, plastic, paper, and glass.',
      'recycle_point2':
          'Ensure that inorganic waste (plastic, paper) is clean and dry.',
      'recycle_point3': 'Deposit the sorted waste at the nearest waste bank.',
      'interesting_facts': 'Interesting Recycling Facts',
      'fact1': 'Recycling 1 ton of paper can save about 17 large trees.',
      'fact2':
          'It takes up to 450 years for a single plastic bottle to decompose in nature.',
      'fact3':
          'The energy saved from recycling one aluminum can could power a TV for 3 hours.',

      // Rewards Screen
      'rewards_title': 'My Rewards',
      'claimed': 'Claimed',
      'claim': 'Claim',
      'recycling_hero': 'Recycling Hero',
      'recycling_hero_desc': 'Successfully reached the 10-item target!',
      'environment_champion': 'Environment Champion',
      'environment_champion_desc': 'Successfully reached the 25-item target!',
      'ecosort_legend': 'EcoSort Legend',
      'ecosort_legend_desc': 'Successfully reached the 50-item target!',
      'congratulations': 'Congratulations!',
      'new_reward_unlocked': 'You have unlocked a new reward:\n"@reward"',
      'view_reward': 'View Reward',
      'close': 'Close',
      'your_voucher': 'Your Voucher!',
      'voucher_desc': 'Use the code below to redeem your prize:',
      'copy_code': 'Copy Code',
      'copied': 'Copied!',
      'voucher_copied': 'The voucher code has been copied.',

      // Community Screen
      'community_title': 'EcoSort Community',
      'community_soon': 'Community Feature Coming Soon!',
      'community_desc':
          'Stay tuned for a feature where you can create teams, compete, and share your recycling achievements with friends!',

      // About Screen
      'about_title': 'About App',
      'version': 'Version 1.0.0',
      'about_desc':
          'EcoSort is a mobile application designed to help users manage and sort their daily waste more efficiently and enjoyably. This app aims to increase environmental awareness and encourage recycling practices.',
      'created_by':
          'This application was created by Joshvin Su (231110317) to fulfill the Remedial Semester assignment.',

      // Notification Controller
      'notification_enabled': 'Notifications Enabled',
      'notification_enabled_desc': 'You will receive updates from EcoSort.',
      'notification_disabled': 'Notifications Disabled',
      'notification_disabled_desc': 'You will no longer receive updates.',
    },
  };
}

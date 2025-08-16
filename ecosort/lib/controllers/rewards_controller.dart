// File: lib/controllers/rewards_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Reward {
  final String title;
  final String description;
  final String voucherCode;
  final RxBool isUnlocked;
  final RxBool isClaimed;

  Reward({
    required this.title,
    required this.description,
    required this.voucherCode,
    bool isUnlocked = false,
    bool isClaimed = false,
  }) : isUnlocked = isUnlocked.obs,
       isClaimed = isClaimed.obs;
}

class RewardsController extends GetxController {
  var rewards = <Reward>[
    Reward(
      title: 'Pahlawan Daur Ulang',
      description: 'Berhasil mencapai target 10 item mingguan!',
      voucherCode: 'ECO-HERO-10',
    ),
    Reward(
      title: 'Juara Lingkungan',
      description: 'Berhasil mencapai target 25 item!',
      voucherCode: 'ECO-CHAMP-25',
    ),
    Reward(
      title: 'Legenda EcoSort',
      description: 'Berhasil mencapai target 50 item!',
      voucherCode: 'ECO-LEGEND-50',
    ),
  ].obs;

  void unlockReward(int index) {
    if (index < rewards.length && !rewards[index].isUnlocked.value) {
      rewards[index].isUnlocked.value = true;
    }
  }

  void claimReward(int index) {
    if (index < rewards.length &&
        rewards[index].isUnlocked.value &&
        !rewards[index].isClaimed.value) {
      rewards[index].isClaimed.value = true;
      _showVoucherDialog(rewards[index]);
    }
  }

  void _showVoucherDialog(Reward reward) {
    Get.defaultDialog(
      title: "Voucher Anda!",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Gunakan kode di bawah ini untuk menukarkan hadiah Anda:"),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              reward.voucherCode,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            icon: const Icon(Icons.copy),
            label: const Text("Salin Kode"),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: reward.voucherCode));
              Get.snackbar(
                "Tersalin!",
                "Kode voucher telah disalin.",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
      confirm: TextButton(
        onPressed: () => Get.back(),
        child: const Text("Tutup"),
      ),
    );
  }
}

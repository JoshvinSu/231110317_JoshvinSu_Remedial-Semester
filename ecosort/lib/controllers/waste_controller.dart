import 'package:ecosort/screens/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/waste_entry.dart';
import 'rewards_controller.dart';

class WasteController extends GetxController {
  var wasteEntries = <WasteEntry>[].obs;

  void addEntry(WasteEntry entry) {
    wasteEntries.add(entry);
    checkRewards();
  }

  void deleteEntry(String id) {
    wasteEntries.removeWhere((entry) => entry.id == id);
  }

  void insertEntry(int index, WasteEntry entry) {
    wasteEntries.insert(index, entry);
  }

  void checkRewards() {
    final RewardsController rewardsController = Get.find();
    int totalEntries = wasteEntries.length;

    if (totalEntries >= 10 && !rewardsController.rewards[0].isUnlocked.value) {
      rewardsController.unlockReward(0);
      _showRewardDialog(rewardsController.rewards[0]);
    }
    if (totalEntries >= 25 && !rewardsController.rewards[1].isUnlocked.value) {
      rewardsController.unlockReward(1);
      _showRewardDialog(rewardsController.rewards[1]);
    }
    if (totalEntries >= 50 && !rewardsController.rewards[2].isUnlocked.value) {
      rewardsController.unlockReward(2);
      _showRewardDialog(rewardsController.rewards[2]);
    }
  }

  void _showRewardDialog(Reward reward) {
    Get.defaultDialog(
      title: "Selamat!",
      middleText: "Anda telah membuka hadiah baru:\n\"${reward.title}\"",
      textConfirm: "Lihat Hadiah",
      textCancel: "Tutup",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        Get.to(() => const RewardsScreen());
      },
    );
  }
}
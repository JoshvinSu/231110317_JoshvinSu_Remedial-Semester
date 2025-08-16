// File: lib/controllers/rewards_controller.dart

import 'package:get/get.dart';

class Reward {
  final String title;
  final String description;
  final RxBool isUnlocked;

  Reward({
    required this.title,
    required this.description,
    bool isUnlocked = false,
  }) : isUnlocked = isUnlocked.obs;
}

class RewardsController extends GetxController {
  var rewards = <Reward>[
    Reward(
      title: 'Pahlawan Daur Ulang',
      description: 'Berhasil mencapai target 10 item mingguan!',
    ),
    Reward(
      title: 'Juara Lingkungan',
      description: 'Berhasil mencapai target 25 item!',
    ),
    Reward(
      title: 'Legenda EcoSort',
      description: 'Berhasil mencapai target 50 item!',
    ),
  ].obs;

  void unlockReward(int index) {
    if (index < rewards.length && !rewards[index].isUnlocked.value) {
      rewards[index].isUnlocked.value = true;
    }
  }
}

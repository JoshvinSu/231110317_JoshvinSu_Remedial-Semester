import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rewards_controller.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RewardsController rewardsController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Hadiah Saya')),
      body: ListView.builder(
        itemCount: rewardsController.rewards.length,
        itemBuilder: (context, index) {
          final reward = rewardsController.rewards[index];
          return Obx(
            () => Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              color: reward.isClaimed.value
                  ? Colors.grey.shade400
                  : reward.isUnlocked.value
                  ? Colors.green.withOpacity(0.2)
                  : Theme.of(context).colorScheme.surface.withOpacity(0.5),
              child: ListTile(
                leading: Icon(
                  reward.isUnlocked.value
                      ? Icons.lock_open_rounded
                      : Icons.lock_outline_rounded,
                  color: reward.isUnlocked.value ? Colors.green : Colors.grey,
                  size: 40,
                ),
                title: Text(
                  reward.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(reward.description),
                trailing: reward.isUnlocked.value
                    ? ElevatedButton(
                        onPressed: reward.isClaimed.value
                            ? null
                            : () => rewardsController.claimReward(index),
                        child: Text(
                          reward.isClaimed.value ? 'Sudah Diklaim' : 'Klaim',
                        ),
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

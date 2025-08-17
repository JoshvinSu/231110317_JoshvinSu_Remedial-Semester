import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Komunitas EcoSort')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.groups, size: 80, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                'Fitur Komunitas Segera Hadir!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Nantikan fitur di mana kamu bisa membuat tim, berkompetisi, dan berbagi pencapaian daur ulangmu dengan teman-teman!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
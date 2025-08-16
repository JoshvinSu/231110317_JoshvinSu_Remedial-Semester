// File: lib/screens/guide_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('guide_title'.tr)),
      body: ListView(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: const Icon(Icons.eco, color: Colors.green),
              title: Text(
                'organic_waste'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('what_includes'.tr),
                  subtitle: Text('organic_includes'.tr),
                ),
                ListTile(
                  title: Text('what_not_includes'.tr),
                  subtitle: Text('organic_not_includes'.tr),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: const Icon(Icons.local_drink, color: Colors.blue),
              title: Text(
                'plastic_waste'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('what_includes'.tr),
                  subtitle: Text('plastic_includes'.tr),
                ),
                ListTile(
                  title: Text('what_not_includes'.tr),
                  subtitle: Text('plastic_not_includes'.tr),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: const Icon(Icons.book, color: Colors.brown),
              title: Text(
                'paper_waste'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('what_includes'.tr),
                  subtitle: Text('paper_includes'.tr),
                ),
                ListTile(
                  title: Text('what_not_includes'.tr),
                  subtitle: Text('paper_not_includes'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

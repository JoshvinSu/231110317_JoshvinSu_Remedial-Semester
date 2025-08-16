// File: lib/screens/add_entry_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/waste_controller.dart';
import '../models/waste_entry.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final WasteController wasteController = Get.find();
  final _descriptionController = TextEditingController();
  String _selectedWasteType = 'Plastik';
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    if (_descriptionController.text.isEmpty) {
      return;
    }
    
    final newEntry = WasteEntry(
      id: Random().nextDouble().toString(),
      wasteType: _selectedWasteType,
      description: _descriptionController.text,
      date: _selectedDate,
    );

    wasteController.addEntry(newEntry);

    Get.back();

    Get.snackbar(
      'success'.tr,
      'add_success_message'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_entry_title'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('choose_waste_type'.tr, style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                Radio<String>(
                  value: 'Plastik',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                Text('plastic'.tr),
                Radio<String>(
                  value: 'Kertas',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                Text('paper'.tr),
                Radio<String>(
                  value: 'Organik',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                Text('organic'.tr),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'description_hint'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('${'date'.tr}: ${DateFormat.yMd().format(_selectedDate)}')),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text('choose_date'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                child: Text('save'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
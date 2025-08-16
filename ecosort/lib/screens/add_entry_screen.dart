// File: lib/screens/add_entry_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/waste_controller.dart';
import '../models/waste_entry.dart';
import 'dart:math';

// POKOK PEMBAHASAN: StatefulWidget
class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final WasteController wasteController = Get.find();
  final _descriptionController = TextEditingController();
  String _selectedWasteType = 'Plastik'; // Default value
  DateTime _selectedDate = DateTime.now();

  void _presentDatePicker() {
    // POKOK PEMBAHASAN: DatePicker
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

    Get.back(); // Kembali ke halaman sebelumnya

    // POKOK PEMBAHASAN: UI Feedback (SnackBar)
    Get.snackbar(
      'Berhasil',
      'Catatan sampah berhasil ditambahkan!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan Sampah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Jenis Sampah:', style: TextStyle(fontSize: 16)),
            // POKOK PEMBAHASAN: Radio Buttons
            Row(
              children: [
                Radio<String>(
                  value: 'Plastik',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                const Text('Plastik'),
                Radio<String>(
                  value: 'Kertas',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                const Text('Kertas'),
                Radio<String>(
                  value: 'Organik',
                  groupValue: _selectedWasteType,
                  onChanged: (value) => setState(() => _selectedWasteType = value!),
                ),
                const Text('Organik'),
              ],
            ),
            const SizedBox(height: 20),

            // POKOK PEMBAHASAN: TextField
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi / Berat Sampah',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // POKOK PEMBAHASAN: DropDown Button (Alternatif dari Chips/Switch)
            // TODO: Kamu bisa implementasikan DropdownButton di sini untuk memilih lokasi.
            // Sebagai contoh, saya tetap menggunakan DatePicker
            
            Row(
              children: [
                Text( 'Tanggal: ${_selectedDate.toLocal()}'.split(' ')[0] ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: const Text('Pilih Tanggal', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            const SizedBox(height: 30),
            // POKOK PEMBAHASAN: Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                child: const Text('Simpan Catatan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
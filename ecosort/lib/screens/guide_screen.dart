// File: lib/screens/guide_screen.dart

import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panduan Daur Ulang')),
      body: ListView(
        children: const <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: Icon(Icons.eco, color: Colors.green),
              title: Text(
                'Sampah Organik',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Apa saja yang termasuk?'),
                  subtitle: Text(
                    'Sisa makanan, daun kering, sayuran, buah-buahan, ampas kopi/teh.',
                  ),
                ),
                ListTile(
                  title: Text('Apa yang tidak termasuk?'),
                  subtitle: Text(
                    'Plastik, kaleng, kaca, bahan kimia, popok bekas.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: Icon(Icons.local_drink, color: Colors.blue),
              title: Text(
                'Sampah Plastik',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Apa saja yang termasuk?'),
                  subtitle: Text(
                    'Botol plastik, kemasan makanan, tas kresek, wadah plastik.',
                  ),
                ),
                ListTile(
                  title: Text('Apa yang tidak termasuk?'),
                  subtitle: Text(
                    'Kertas, sisa makanan, baterai, barang elektronik.',
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: Icon(Icons.book, color: Colors.brown),
              title: Text(
                'Sampah Kertas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Apa saja yang termasuk?'),
                  subtitle: Text(
                    'Koran, majalah, kardus, kertas HVS, buku tulis.',
                  ),
                ),
                ListTile(
                  title: Text('Apa yang tidak termasuk?'),
                  subtitle: Text(
                    'Kertas thermal (struk), kertas berminyak, tisu bekas, styrofoam.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

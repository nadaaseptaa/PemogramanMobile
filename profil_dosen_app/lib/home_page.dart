import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> dosenList = const [
    {
      'nama': 'Ahmad Nasukha, S.Hum., M.S.I',
      'mata_kuliah': 'Pemrograman Mobile',
      'NIP': '19880872220171009',
    },
    {
      'nama': 'Pol Metra, M.Kom',
      'mata_kuliah': 'Multimedia',
      'NIP': '19910615010122045',
    },
    {
      'nama': 'Dila Nurlaila, M.Kom',
      'mata_kuliah': 'Rekayasa Perangkat Lunak',
      'NIP': '1571015201960020',
    },
    {
      'nama': 'Wahyu Anggoro, M.KOM',
      'mata_kuliah': 'Manajemen Risiko',
      'NIP': '15710823099600219',
    },
    {
      'nama': 'M. Yusuf, S.KOM., M.S.I',
      'mata_kuliah': 'Technoprenuership',
      'NIP': '1988021420191007',
    },
    {
      'nama': 'Fatima Felawati, S.KOM., M.KOM',
      'mata_kuliah': 'Testing dan Implementasi System',
      'NIP': '199305112025052004',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Dosen'), centerTitle: true),
      body: ListView.builder(
        itemCount: dosenList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                dosen['nama']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Mata Kuliah: ${dosen['mata_kuliah']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(dosen: dosen),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

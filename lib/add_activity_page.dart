import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  double _duration = 1;
  int _difficulty = 3;

  void _save() {
    if (_nameController.text.isEmpty || _descController.text.isEmpty) {
<<<<<<< HEAD
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua form wajib diisi')),
      );
=======
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua form wajib diisi')));
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
      return;
    }

    final newActivity = Activity(
      kegiatan: _nameController.text,
      tanggal: DateTime.now().toString().split(' ')[0],
      durasi: _duration.round(),
      kesulitan: _difficulty,
      deskripsi: _descController.text,
    );

    Navigator.pop(context, newActivity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Aktivitas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Aktivitas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            Text("Durasi (menit): ${_duration.round()}"),
            Slider(
              min: 10,
              max: 120,
              divisions: 11,
              value: _duration,
              label: _duration.round().toString(),
              onChanged: (v) => setState(() => _duration = v),
            ),

            const SizedBox(height: 12),

            Text("Tingkat Kesulitan: $_difficulty"),
            Slider(
              min: 1,
              max: 5,
              divisions: 4,
              value: _difficulty.toDouble(),
              label: _difficulty.toString(),
              onChanged: (v) => setState(() => _difficulty = v.round()),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _descController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

<<<<<<< HEAD
            ElevatedButton(
              onPressed: _save,
              child: const Text("Simpan"),
            )
=======
            ElevatedButton(onPressed: _save, child: const Text("Simpan")),
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
          ],
        ),
      ),
    );
  }
}

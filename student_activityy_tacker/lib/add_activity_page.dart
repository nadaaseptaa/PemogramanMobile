import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class AddActivityPage extends StatefulWidget {
  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  String category = "Belajar";
  double duration = 1;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Aktivitas")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama Aktivitas"),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Masukkan nama aktivitas...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Kategori Aktivitas"),
            DropdownButtonFormField(
              value: category,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: [
                "Belajar",
                "Ibadah",
                "Olahraga",
                "Hiburan",
                "Lainnya",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                setState(() {
                  category = value.toString();
                });
              },
            ),

            const SizedBox(height: 16),
            const Text("Durasi (Jam):"),
            Slider(
              value: duration,
              min: 1,
              max: 8,
              divisions: 7,
              label: "${duration.round()} Jam",
              onChanged: (value) {
                setState(() {
                  duration = value;
                });
              },
            ),

            SwitchListTile(
              title: const Text("Status Aktivitas"),
              subtitle: Text(isDone ? "Sudah Selesai" : "Belum"),
              value: isDone,
              onChanged: (value) {
                setState(() {
                  isDone = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text("Catatan Tambahan"),
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Catatan opsional...",
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Error"),
                        content: const Text("Nama aktivitas wajib diisi!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  final newActivity = ActivityModel(
                    name: nameController.text,
                    category: category,
                    duration: duration,
                    isDone: isDone,
                    notes: notesController.text,
                  );

                  Navigator.pop(context, newActivity);
                },
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final ActivityModel activity;

  const ActivityDetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Aktivitas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${activity.name}", style: titleStyle()),
            Text("Kategori: ${activity.category}", style: textStyle()),
            Text("Durasi: ${activity.duration} Jam", style: textStyle()),
            Text(
              "Status: ${activity.isDone ? "Selesai" : "Belum"}",
              style: textStyle(),
            ),
            const SizedBox(height: 12),
            const Text(
              "Catatan:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(activity.notes.isEmpty ? "-" : activity.notes),

            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Hapus Aktivitas?"),
                    content: const Text(
                      "Apakah kamu yakin ingin menghapus aktivitas ini?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, "deleted");
                        },
                        child: const Text("Hapus"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "Hapus Aktivitas",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle titleStyle() =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle textStyle() => const TextStyle(fontSize: 16);
}

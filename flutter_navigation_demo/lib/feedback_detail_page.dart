import 'package:flutter/material.dart';

class FeedbackDetailPage extends StatelessWidget {
  final Map<String, dynamic>? data;

  const FeedbackDetailPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final name = data?['name'] ?? "Tidak ada nama";
    final comment = data?['comment'] ?? "Tidak ada komentar";

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Feedback"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data Feedback:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Text("Nama: $name", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Komentar: $comment", style: const TextStyle(fontSize: 18)),

            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // kembali ke halaman sebelumnya
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

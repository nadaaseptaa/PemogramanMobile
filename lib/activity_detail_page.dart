import 'package:flutter/material.dart';
import 'model/activity_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;

  const ActivityDetailPage({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Aktivitas'),
<<<<<<< HEAD
      ),
      body: Padding(
=======
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
<<<<<<< HEAD
=======
              elevation: 3,
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.kegiatan,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
<<<<<<< HEAD
                        const Icon(Icons.calendar_today),
=======
                        const Icon(Icons.calendar_today, size: 20),
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
                        const SizedBox(width: 8),
                        Text("Tanggal: ${activity.tanggal}"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
<<<<<<< HEAD
                        const Icon(Icons.timer),
=======
                        const Icon(Icons.timer, size: 20),
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
                        const SizedBox(width: 8),
                        Text("Durasi: ${activity.durasi} menit"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
<<<<<<< HEAD
                        const Icon(Icons.star),
                        const SizedBox(width: 8),
                        Text("Tingkat kesulitan: ${activity.kesulitan}/5"),
=======
                        const Icon(Icons.star, size: 20),
                        const SizedBox(width: 8),
                        Text("Kesulitan: ${activity.kesulitan}/5"),
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Deskripsi:",
<<<<<<< HEAD
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
>>>>>>> 8987424fdda1b9758c58286a5ae76dfafaf4133d
                    ),
                    const SizedBox(height: 6),
                    Text(
                      activity.deskripsi,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

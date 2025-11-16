import 'package:flutter/material.dart';
import 'model/activity_model.dart';
import 'add_activity_page.dart';
import 'activity_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Aktivitas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push<Activity?>(
                  context,
                  MaterialPageRoute(builder: (_) => const AddActivityPage()),
                );

                if (result != null) {
                  setState(() => activities.add(result));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Aktivitas ditambahkan")),
                  );
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("Tambah Aktivitas"),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: activities.isEmpty
                  ? const Center(child: Text("Belum ada aktivitas"))
                  : ListView.builder(
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        final a = activities[index];
                        return Card(
                          child: ListTile(
                            title: Text(a.kegiatan),
                            subtitle: Text(
                              "${a.tanggal} • ${a.durasi} menit • Kesulitan ${a.kesulitan}/5",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ActivityDetailPage(activity: a),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

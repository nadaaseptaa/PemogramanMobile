import 'package:flutter/material.dart';
import 'add_activity_page.dart';
import 'activity_detail_page.dart';
import 'model/activity_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ActivityModel> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Activity Tracker",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: activities.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada aktivitas.\nTekan tombol + untuk menambah.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final item = activities[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        "Durasi: ${item.duration} jam • Status: ${item.isDone ? "Selesai" : "Belum"}",
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ActivityDetailPage(activity: item),
                          ),
                        );

                        if (result == "deleted") {
                          setState(() {
                            activities.removeAt(index);
                          });
                        }
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
        onPressed: () async {
          final newActivity = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddActivityPage()),
          );

          if (newActivity != null) {
            setState(() {
              activities.add(newActivity);
            });
          }
        },
      ),
    );
  }
}

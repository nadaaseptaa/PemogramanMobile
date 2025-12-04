import 'package:flutter/material.dart';
import 'screens/note_list_screen.dart';

void main() {
  runApp(const MyApp()); // gunakan const di sini
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // ← perbaikan: tambahkan key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pink Notes',
      theme: ThemeData(primarySwatch: Colors.pink),
      home:
          const NoteListScreen(), // tambahkan const kalau konstruktor mendukung
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'services/storage_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const StudentNotesApp());
}

class StudentNotesApp extends StatelessWidget {
  const StudentNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Notes App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(), // ← INI AMAN
    );
  }
}

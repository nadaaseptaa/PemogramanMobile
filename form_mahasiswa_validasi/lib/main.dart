import 'package:flutter/material.dart';
import 'register_stepper_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // menggunakan super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterStepperPage(),
    );
  }
}

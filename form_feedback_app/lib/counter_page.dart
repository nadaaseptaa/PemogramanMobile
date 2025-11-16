// lib/counter_page.dart

import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F6), // Soft Pink Background
      appBar: AppBar(
        title: const Text('Counter Page (Tidak Digunakan)'),
        backgroundColor: const Color(0xFFFF4DA6), // Fresh Pink
      ),
      body: const Center(
        child: Text(
          'Halaman ini tidak diimplementasikan untuk tugas feedback.',
          style: TextStyle(
            color: Color(0xFFE60073), // Darker modern pink text
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50], // background soft pink
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text(
          "Biodata App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto Profil
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pink[200],
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),

                // Nama
                const Text(
                  "Nanda Septa Lian Sari",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(height: 5),

                // NIM
                const Text(
                  "NIM: 701230043",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 5),

                // Program Studi
                const Text(
                  "Program Studi: Sistem Informasi\nUniversitas Islam Negeri Sulthan Thaha Saifuddin Jambi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Hobi
                const Text(
                  "Hobi: Memasak dan Bernyanyi",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),

                // Quotes
                const Text(
                  "\"Hidup adalah perjalanan, bukan perlombaan.\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 20),

                // Kontak
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.email, color: Colors.pink),
                    SizedBox(width: 8),
                    Text("nandaseptaliansari@gmail.com"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone_android, color: Colors.pink),
                    SizedBox(width: 8),
                    Text("IG: @nandaseptaliansari_"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

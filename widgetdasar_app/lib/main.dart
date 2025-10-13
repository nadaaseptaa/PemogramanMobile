import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> _launchUrl(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Tidak bisa membuka $url';
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Biodata',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        fontFamily: 'Montserrat',
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
        title: const Text(
          'Biodata',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nanda Septa Lian Sari',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Pengembang Flutter | Desainer UI/UX',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Perbaikan: gunakan FontAwesomeIcons.whatsapp dari font_awesome_flutter
                      _buildSocialButton(
                        'https://wa.me/6283105072053',
                        FontAwesomeIcons.whatsapp,
                        Colors.green,
                      ),
                      const SizedBox(width: 20),

                      _buildSocialButton(
                        'https://instagram.com/nandaseptaliansari_',
                        Icons.camera_alt,
                        Colors.pink,
                      ),
                      const SizedBox(width: 20),
                      _buildSocialButton(
                        'mailto:nandaseptaliansari@gmail.com',
                        Icons.email,
                        Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Saya',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBioCard(
                    'Email',
                    'nandaseptaliansari@gmail.com',
                    Icons.email,
                  ),
                  _buildBioCard('Telepon', '+62 831 0507 2053', Icons.phone),
                  _buildBioCard(
                    'Lokasi',
                    'Bayung Lencir, Jambi, Indonesia',
                    Icons.location_on,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Portofolio',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildPortfolioButton(
                    context,
                    'Lihat Portofolio',
                    Icons.work,
                    Colors.blueGrey,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String url, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        _launchUrl(Uri.parse(url));
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildBioCard(String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueGrey, size: 28),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        _launchUrl(Uri.parse('https://nama-anda.github.io/portfolio'));
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
      ),
    );
  }
}

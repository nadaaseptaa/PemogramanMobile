class Activity {
  final String kegiatan;
  final String tanggal;
  final int durasi; // menit
  final int kesulitan; // 1–5
  final String deskripsi;

  Activity({
    required this.kegiatan,
    required this.tanggal,
    required this.durasi,
    required this.kesulitan,
    required this.deskripsi,
  });
}

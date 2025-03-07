class MitigasiModel {
  final String judul;
  final String gambar;
  final String deskripsiBencana; // Penjelasan umum tentang bencana
  final List<String> langkahMitigasi; // Langkah mitigasi khusus untuk bencana

  MitigasiModel({
    required this.judul,
    required this.gambar,
    required this.deskripsiBencana,
    required this.langkahMitigasi,
  });
}

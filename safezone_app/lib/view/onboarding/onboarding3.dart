import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan dimensi layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.1), // Jarak atas dinamis
          // Menggunakan Flexible agar gambar dapat menyesuaikan lebar dan tinggi layar
          Flexible(
            child: Image.asset(
              'assets/images/onboarding3.png',
              width: screenWidth * 0.8, // Lebar gambar menjadi 80% dari lebar layar
              height: screenHeight * 0.4, // Tinggi gambar 40% dari tinggi layar
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Jarak dinamis antar elemen
          Text(
            "Persiapkan Risiko Bencana",
            style: TextStyle(
              fontSize: screenWidth * 0.05,  // Ukuran font dinamis, 5% dari lebar layar
              fontWeight: FontWeight.w800,  // Menggunakan ExtraBold
              color: Color(0xFF1E7F1D),  // Warna hijau
              fontFamily: 'Raleway',
            ),
          ),
          SizedBox(height: screenHeight * 0.03), // Jarak dinamis antar elemen
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Padding horizontal dinamis
            child: Text(
              "Dengan adanya penandaan lokasi bencana, SafeZone INDO membantu Anda tetap siap dan terlindungi.",
              style: TextStyle(
                fontSize: screenWidth * 0.04,  // Ukuran font dinamis, 4% dari lebar layar
                color: Color(0xFF5D5D5D),
                fontWeight: FontWeight.w400,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center, // Teks rata tengah
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // Jarak bawah dinamis
        ],
      ),
    );
  }
}
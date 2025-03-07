import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1), // Jarak atas berdasarkan 10% dari tinggi layar
            Image.asset(
              'assets/images/onboarding1.png',
              width: screenWidth * 0.98, // Lebar gambar 80% dari lebar layar
              height: screenHeight * 0.4, // Tinggi gambar 40% dari tinggi layar
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.05), // Jarak setelah gambar berdasarkan 5% dari tinggi layar
            Text(
              "Selamat Datang Di SafeZone INDO",
              style: TextStyle(
                fontSize: screenWidth * 0.045,  // Ukuran font 4.5% dari lebar layar
                fontWeight: FontWeight.w800,  // Menggunakan ExtraBold
                color: Color(0xFF1E7F1D),  // Warna hijau
                fontFamily: 'Raleway',  // Menggunakan font Raleway
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Jarak 3% dari tinggi layar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // Padding horizontal 10% dari lebar layar
              child: Text(
                "Di SafeZone INDO, kami menyediakan peta interaktif dan informasi bencana yang membantu Anda tetap aman. Masuk atau daftar untuk memulai dan menjelajahi fitur-fitur kami.",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,  // Ukuran font 3.5% dari lebar layar
                  color: Color(0xFF5D5D5D),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Raleway',
                ),
                textAlign: TextAlign.center,  // Teks rata tengah
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // Jarak 5% dari tinggi layar
          ],
        ),
      ),
    );
  }
}
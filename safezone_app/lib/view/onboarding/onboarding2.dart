import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar saat ini
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1), // Jarak atas sesuai dengan tinggi layar
                Image.asset(
                  'assets/images/onboarding2.png',
                  width: screenWidth * 0.98, // Lebar gambar berdasarkan lebar layar
                  height: screenHeight * 0.4, // Tinggi gambar berdasarkan tinggi layar
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * 0.05), // Jarak antara gambar dan teks
                Text(
                  "Jelajahi Risiko Bencana Alam di Indonesia",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Ukuran font berdasarkan lebar layar
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E7F1D),
                    fontFamily: 'Raleway',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02), // Jarak antara teks dan deskripsi
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Padding teks berdasarkan lebar layar
                  child: Text(
                    "Dengan SafeZone INDO, Anda bisa dengan mudah melihat dan memahami lokasi rawan bencana di Indonesia.",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Ukuran font deskripsi berdasarkan lebar layar
                      color: Color(0xFF5D5D5D),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Jarak bawah yang proporsional
              ],
            ),
          );
        },
      ),
    );
  }
}
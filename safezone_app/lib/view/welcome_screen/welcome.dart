import 'package:flutter/material.dart';
import 'dart:async';
import 'package:safezone_app/view/onboarding/onboarding_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Menunda selama 5 detik sebelum berpindah halaman
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,  // Warna background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menyesuaikan ukuran logo berdasarkan lebar layar
            Image.asset(
              'assets/images/1.png', 
              width: screenWidth * 0.3,  // 30% dari lebar layar
              height: screenHeight * 0.2, // 20% dari tinggi layar
            ),
            SizedBox(height: screenHeight * 0.02),  // Jarak antara logo dan teks, 2% dari tinggi layar
            Text(
              'SafeZone SULTENG',
              style: TextStyle(
                fontSize: screenWidth * 0.06,  // Ukuran font 6% dari lebar layar
                fontWeight: FontWeight.w800,  // Menggunakan ExtraBold
                fontStyle: FontStyle.italic,  // Menggunakan gaya Italic
                color: Color(0xFF1E7F1D),  // Mengubah warna menjadi 1E7F1D
                fontFamily: 'Raleway',  // Menggunakan font Raleway
              ),
            ),
          ],
        ),
      ),
    );
  }
}
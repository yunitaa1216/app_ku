import 'package:flutter/material.dart';
import 'package:safezone_app/view/widgets/bottom_navigation_bar.dart';
import 'homepage_peta.dart'; // Import halaman peta
import 'homepage_mitigasi.dart'; // Import halaman mitigasi

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan index yang dipilih

  // Fungsi untuk menangani tap pada item navigasi
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 1:
        Navigator.pushNamed(context, '/peta');
        break;
      case 2:
        Navigator.pushNamed(context, '/mitigasi');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final containerHeight = screenHeight * 0.32; // Tinggi container hijau
        final imageSize = screenWidth * 0.4; // Lebar dan tinggi gambar

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Stack untuk container hijau
                Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: containerHeight + 20,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBDE1B9),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        height: containerHeight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: screenHeight * 0.06), // Tambahkan SizedBox untuk menurunkan item
    // Baris untuk ikon notifikasi dan teks "Bertindak Sekarang"
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ // Jarak antara ikon dan teks
        Text(
          'Bertindak Sekarang',
          style: TextStyle(
            fontSize: screenWidth * 0.05, // Perbesar ukuran font
            fontWeight: FontWeight.bold,
            color: Color(0xFF0C0C0C),
          ),
        ),
        // SizedBox(width: 15),
        Icon(
          Icons.notifications_active_outlined, // Ikon notifikasi
          size: 24, // Ukuran ikon
          color: Colors.grey, // Warna ikon
        ),
      ],
    ),
    SizedBox(height: screenHeight * 0.01), // Tambahkan spacing
    Text(
      'Pantau dan ambil tindakan untuk melindungi diri dan orang-orang terdekat.',
      style: TextStyle(
        fontSize: screenWidth * 0.038, // Perbesar ukuran font
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
      ),
    ),
    SizedBox(height: screenHeight * 0.018), // Tambahkan spacing
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Lihat Peta',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500, // Tebalkan font
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E7F1D),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08,
              vertical: screenHeight * 0.015, // Tambahkan padding
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Lebih rounded
            ),
            elevation: 5, // Tambahkan shadow
          ),
        ),
        Transform.translate(
          offset: Offset(0, -screenHeight * 0.01),
          child: Image.asset(
            'assets/images/home.png',
            width: imageSize,
            height: imageSize * 0.7,
            fit: BoxFit.contain, // Pastikan gambar proporsional
          ),
        ),
      ],
    ),
  ],
),
                        ),
                      ),
                    ),
                  ],
                ),
                // Pindahkan HomepagePeta sedikit ke atas
                Transform.translate(
                  offset: Offset(0, -screenHeight * 0.02), // Naikkan peta ke atas
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Card(
                      elevation: 5, // Tambahkan shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Lebih rounded
                      ),
                      child: HomepagePeta(),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -screenHeight * 0.026), // Naikkan mitigasi sedikit
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Card(
                      elevation: 5, // Tambahkan shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Lebih rounded
                      ),
                      child: MitigasiPage(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}
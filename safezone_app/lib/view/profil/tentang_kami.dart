import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          title: Text('Tentang Kami', 
          style: TextStyle(
            color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          backgroundColor: Color(0xFFBDE1B9),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
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
                    SizedBox(height: 30), // Jarak antara gambar dan teks
                    Text(
                      'SafeZone Sulteng adalah aplikasi inovatif yang dirancang khusus untuk memantau dan mengelola risiko bencana di Provinsi Sulawesi Tengah. Dengan tujuan utama untuk melindungi komunitas dan meningkatkan keselamatan, aplikasi ini menyediakan informasi terkini tentang area rawan bencana, termasuk kebakaran hutan, banjir, longsor, dan gempa bumi.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20), // Jarak antara teks dan visi
                    Text(
                      'Visi kami:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10), // Jarak antara teks visi dan misi
                    Text(
                      'Kami berkomitmen untuk menjadi sumber informasi yang terpercaya dalam upaya mitigasi bencana alam. Visi kami adalah menciptakan lingkungan yang lebih aman dan siap menghadapi bencana, dengan memberdayakan masyarakat melalui data yang akurat dan mudah diakses.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20), // Jarak antara misi dan detail misi
                    Text(
                      'Misi kami:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10), // Jarak antara teks misi dan poin misi
                    Text(
                      'Misi kami adalah untuk meningkatkan kesadaran dan kesiapsiagaan bencana di Sulawesi Tengah dengan menyediakan informasi yang relevan. Kami percaya bahwa dengan persiapan yang tepat dan pengetahuan yang memadai, kita dapat mengurangi dampak bencana dan melindungi kehidupan serta properti.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

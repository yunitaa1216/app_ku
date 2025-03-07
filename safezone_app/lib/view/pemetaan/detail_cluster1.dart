import 'package:flutter/material.dart';

class DetailClusterPage extends StatelessWidget {
  final String title;
  final String description;
  final String details;
  final Color color;
  final String imagePath;

  DetailClusterPage({
    required this.title,
    required this.description,
    required this.details,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.001), // Responsif padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: screenHeight * 0.3, // Responsif tinggi gambar
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/petakuu.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsif jarak antar widget
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsif ukuran teks
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsif ukuran teks
                  color: Color(0xFF939393),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                details,
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsif ukuran teks
                  color: Color(0xFF646464),
                  fontFamily: 'Raleway',
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                imagePath,
                height: screenHeight * 0.3, // Responsif tinggi gambar
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class MitigasiPage extends StatefulWidget {
  @override
  _MitigasiPageState createState() => _MitigasiPageState();
}

class _MitigasiPageState extends State<MitigasiPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchLatestEarthquakes() async {
    try {
      final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.xml'));

      if (response.statusCode == 200) {
        final Xml2Json xml2json = Xml2Json();
        xml2json.parse(response.body);
        var jsonData = json.decode(xml2json.toParker());

        // Debug: Cetak struktur JSON untuk memeriksa
        debugPrint(jsonData.toString());

        // Ekstrak data gempa
        if (jsonData['Infogempa'] != null && jsonData['Infogempa']['gempa'] != null) {
          var earthquakes = jsonData['Infogempa']['gempa'];

          // Jika data gempa berupa List, ambil 3 data pertama
          if (earthquakes is List) {
            return earthquakes.take(3).map((e) => e as Map<String, dynamic>).toList();
          }
          // Jika data gempa berupa Map (hanya 1 data), konversi ke List
          else if (earthquakes is Map<String, dynamic>) {
            return [earthquakes];
          }
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return []; // Kembalikan list kosong jika terjadi error
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchLatestEarthquakes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Tidak ada data gempa terkini yang tersedia.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            var earthquakes = snapshot.data!;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: screenWidth * 0.034), // Memberikan jarak ke kanan
                    Text(
                      'Temukan Bencana Terkini',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pemetaaan');
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway',
                          color: Color(0xFF1E7F1D),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: screenWidth * 0.02),
                SizedBox(
                  height: 410, // Sesuaikan tinggi
                  child: PageView.builder(
                    itemCount: earthquakes.length,
                    itemBuilder: (context, index) {
                      var earthquake = earthquakes[index];
                      List<String> coordinates = earthquake['point']['coordinates'].split(',');
                      double latitude = double.parse(coordinates[0]);
                      double longitude = double.parse(coordinates[1]);
                      LatLng earthquakeLocation = LatLng(latitude, longitude);

                          "${earthquake['Tanggal']}, ${earthquake['Jam']}\n"
                          // "Jam: ${earthquake['Jam']}\n"
                          "${earthquake['Magnitude']}\n";
                          // "Kedalaman: ${earthquake['Kedalaman']}\n"
                          // "Wilayah: ${earthquake['Wilayah']}\n"
                          // "Potensi: ${earthquake['Potensi']}";

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 240,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: FlutterMap(
                                    options: MapOptions(
                                      initialCenter: earthquakeLocation,
                                      initialZoom: 5.0,
                                      minZoom: 3.0,
                                      maxZoom: 18.0,
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        subdomains: ['a', 'b', 'c'],
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: earthquakeLocation,
                                            width: 40,
                                            height: 40,
                                            child: AnimatedBuilder(
                                              animation: _animationController,
                                              builder: (context, child) {
                                                return Opacity(
                                                  opacity: _animationController.value,
                                                  child: Icon(
                                                    Icons.warning_amber,
                                                    size: 30,
                                                    color: Colors.red,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
  padding: const EdgeInsets.all(5.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan judul
    children: [
      Text(
        'Gempa Bumi Terkini',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
      Align(
        alignment: Alignment.centerLeft, // Rata kiri untuk informasi gempa
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Waktu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "${earthquake['Tanggal']}, ${earthquake['Jam']}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Magnitude",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "${earthquake['Magnitude']}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
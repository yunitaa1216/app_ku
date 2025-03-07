import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  final MapController _mapController1 = MapController();
  final MapController _mapController2 = MapController();
  final MapController _mapController3 = MapController();
  LatLng? _latestEarthquakeLocation;
  LatLng? _secondEarthquakeLocation;
  LatLng? _lastEarthquakeLocation;
  String? _latestEarthquakeInfo;
  String? _secondEarthquakeInfo;
  String? _lastEarthquakeInfo;
  late AnimationController _animationController;
  List<dynamic> _earthquakes = [];
  TextEditingController _searchController = TextEditingController();
  TextEditingController _dateController = TextEditingController(); // Controller untuk input tanggal
  bool _isSearching = false; // Flag untuk menandai apakah sedang melakukan pencarian
  bool _noDataFound = false; // Flag untuk menandai apakah data tidak ditemukan

  @override
  void initState() {
    super.initState();
    fetchLatestEarthquakes();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _dateController.dispose(); // Dispose controller tanggal
    super.dispose();
  }

  Future<void> fetchLatestEarthquakes() async {
    try {
      final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.xml'));

      if (response.statusCode == 200) {
        final Xml2Json xml2json = Xml2Json();
        xml2json.parse(response.body);
        var jsonData = json.decode(xml2json.toParker());

        setState(() {
          _earthquakes = jsonData['Infogempa']['gempa'];
          _updateEarthquakeData();
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void _updateEarthquakeData() {
    if (_earthquakes.isNotEmpty && _earthquakes.length >= 3) {
      List<String> coordinates1 = _earthquakes[0]['point']['coordinates'].split(',');
      double latitude1 = double.parse(coordinates1[0]);
      double longitude1 = double.parse(coordinates1[1]);

      List<String> coordinates2 = _earthquakes[1]['point']['coordinates'].split(',');
      double latitude2 = double.parse(coordinates2[0]);
      double longitude2 = double.parse(coordinates2[1]);

      List<String> coordinates3 = _earthquakes[2]['point']['coordinates'].split(',');
      double latitude3 = double.parse(coordinates3[0]);
      double longitude3 = double.parse(coordinates3[1]);

      setState(() {
        _latestEarthquakeLocation = LatLng(latitude1, longitude1);
        _secondEarthquakeLocation = LatLng(latitude2, longitude2);
        _lastEarthquakeLocation = LatLng(latitude3, longitude3);

        _latestEarthquakeInfo = "Waktu: ${_earthquakes[0]['Tanggal']}, ${_earthquakes[0]['Jam']}\n"
            // "Jam: ${_earthquakes[0]['Jam']}\n"
            "Magnitude: ${_earthquakes[0]['Magnitude']}\n"
            // "Kedalaman: ${_earthquakes[0]['Kedalaman']}\n"
            "Lokasi: ${_earthquakes[0]['Wilayah']}\n"
            "Potensi: ${_earthquakes[0]['Potensi']}";

        _secondEarthquakeInfo = "Waktu: ${_earthquakes[1]['Tanggal']}, ${_earthquakes[1]['Jam']}\n"
            "Magnitude: ${_earthquakes[1]['Magnitude']}\n"
            "Kedalaman: ${_earthquakes[1]['Kedalaman']}\n"
            "Lokasi: ${_earthquakes[1]['Wilayah']}\n"
            "Potensi: ${_earthquakes[1]['Potensi']}";

         _lastEarthquakeInfo = "Waktu: ${_earthquakes[2]['Tanggal']}, ${_earthquakes[2]['Jam']}\n"
            "Magnitude: ${_earthquakes[2]['Magnitude']}\n"
            "Kedalaman: ${_earthquakes[2]['Kedalaman']}\n"
            "Lokasi: ${_earthquakes[2]['Wilayah']}\n"
            "Potensi: ${_earthquakes[2]['Potensi']}";

        _mapController1.move(_latestEarthquakeLocation!, 8.0);
        _mapController2.move(_secondEarthquakeLocation!, 8.0);
        _mapController3.move(_lastEarthquakeLocation!, 8.0);
      });
    }
  }

  void _updateFilteredEarthquakes() {
  if (_dateController.text.isNotEmpty) {
    List<dynamic> filteredEarthquakes = _earthquakes.where((earthquake) {
      return earthquake['Tanggal'].contains(_dateController.text); // Memfilter berdasarkan tanggal
    }).toList();

    if (filteredEarthquakes.isNotEmpty) {
      List<String> coordinates1 = filteredEarthquakes[0]['point']['coordinates'].split(',');
      double latitude1 = double.parse(coordinates1[0]);
      double longitude1 = double.parse(coordinates1[1]);

      setState(() {
        _latestEarthquakeLocation = LatLng(latitude1, longitude1);
        _latestEarthquakeInfo = "Waktu: ${filteredEarthquakes[0]['Tanggal']}, ${filteredEarthquakes[0]['Jam']}\n"
            "Magnitude: ${filteredEarthquakes[0]['Magnitude']}\n"
            "Lokasi: ${filteredEarthquakes[0]['Wilayah']}\n"
            "Potensi: ${filteredEarthquakes[0]['Potensi']}";

        _mapController1.move(_latestEarthquakeLocation!, 8.0);
        _isSearching = true; // Set flag pencarian menjadi true
        _noDataFound = false; // Set flag data tidak ditemukan menjadi false
      });
    } else {
      setState(() {
        _latestEarthquakeLocation = null;
        _latestEarthquakeInfo = null;
        _isSearching = true; // Tetap set flag pencarian menjadi true
        _noDataFound = true; // Set flag data tidak ditemukan menjadi true
      });
    }
  } else {
    setState(() {
      _isSearching = false; // Set flag pencarian menjadi false
      _noDataFound = false; // Set flag data tidak ditemukan menjadi false
      _updateEarthquakeData(); // Kembalikan ke data awal
    });
  }
}

  Widget buildEarthquakeCard(String title, LatLng? location, String? info, MapController controller) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter: location ?? LatLng(-2.548926, 118.0148634),
                initialZoom: 5.0,
                minZoom: 3.0,
                maxZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                if (location != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
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
        if (info != null)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Teks informasi rata kiri
              children: [
                Center( // Teks "Gempa Bumi Terkini" di tengah
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ...info.split('\n').map((line) {
                  int colonIndex = line.indexOf(':'); // Cari indeks ':' pertama
                  String titlePart = line.substring(0, colonIndex).trim(); // Ambil bagian judul
                  String contentPart = line.substring(colonIndex + 1).trim(); // Ambil bagian isi

                  // Jika ini adalah bagian "Potensi", tampilkan di tengah dengan kontainer hijau
                  if (titlePart == "Potensi") {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFBDE1B9), // Warna latar belakang hijau
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          contentPart,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF000000), // Warna teks putih
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }

                  // Jika bukan bagian "Potensi", tampilkan seperti biasa
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Teks informasi rata kiri
                    children: [
                      Text(
                        titlePart, // Bagian judul (misalnya "Tanggal")
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        contentPart, // Bagian isi (misalnya "12 Mei 2023")
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 5), // Jarak antara setiap baris
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bencana Terkini',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBDE1B9),
        elevation: 5,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Cari data gempa',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[500]!),
                ),
              ),
              onChanged: (value) {
                _updateFilteredEarthquakes(); // Memperbarui data gempa berdasarkan tanggal
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    if (_isSearching && _noDataFound)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Tidak ada data gempa untuk tanggal tersebut.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (_isSearching && !_noDataFound)
                      buildEarthquakeCard("Gempa Bumi Terkini", _latestEarthquakeLocation, _latestEarthquakeInfo, _mapController1),
                    if (!_isSearching) ...[
                      buildEarthquakeCard("Gempa Bumi Terkini", _latestEarthquakeLocation, _latestEarthquakeInfo, _mapController1),
                      SizedBox(height: 10),
                      buildEarthquakeCard("Gempa Bumi Terkini", _secondEarthquakeLocation, _secondEarthquakeInfo, _mapController2),
                      SizedBox(height: 10),
                      buildEarthquakeCard("Gempa Bumi Terkini", _lastEarthquakeLocation, _lastEarthquakeInfo, _mapController3),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
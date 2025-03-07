import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:safezone_app/view/mitigasi/mitigasi_detail.dart';
import 'package:safezone_app/view/widgets/bottom_navigation_bar.dart';
import 'mitigasi_widget.dart'; // Pastikan file ini diimpor

class MitigasiView extends StatelessWidget {
  const MitigasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peta',
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MitigasiWidget(), // Widget tombol mitigasi
              SizedBox(height: 5.0), // Spasi antara widget
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Border radius untuk peta
                child: SizedBox(
                  height: 220, // Tinggi peta
                  width: 330, // Lebar penuh
                  child: PetaInteraktif(), // Widget peta interaktif
                ),
              ),
              SizedBox(height: 10),
              ClusterView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/peta');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/mitigasi');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profil');
          }
        },
      ),
    );
  }
}

// Widget PetaInteraktif
class PetaInteraktif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-2.5489, 118.0149), // Pusat peta di Indonesia
        initialZoom: 4.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: provinsiCluster.map((provinsi) {
            return Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(provinsi['latitude'], provinsi['longitude']),
              child: GestureDetector(
                onTap: () {
                  _showProvinsiInfo(context, provinsi);
                },
                child: Icon(
                  Icons.location_on,
                  color: _getClusterColor(provinsi['cluster']),
                  size: 40.0,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getClusterColor(int cluster) {
    switch (cluster) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _showProvinsiInfo(BuildContext context, Map<String, dynamic> provinsi) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF1E7F1D), width: 3),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                provinsi['provinsi'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBDE1B9),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Cluster: ${provinsi['cluster']}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFBDE1B9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tutup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}

// Data provinsiCluster
final List<Map<String, dynamic>> provinsiCluster = [
  { "provinsi": "Jawa Barat", "cluster": 1, "latitude": -6.9147, "longitude": 107.6098 },
  { "provinsi": "Aceh", "cluster": 2, "latitude": 4.6951, "longitude": 96.7494 },
  { "provinsi": "Sumatera Utara", "cluster": 2, "latitude": 2.1154, "longitude": 99.5451 },
  { "provinsi": "Sumatera Barat", "cluster": 2, "latitude": -0.7397, "longitude": 100.8000 },
  { "provinsi": "Riau", "cluster": 2, "latitude": 0.2933, "longitude": 101.7068 },
  { "provinsi": "Jawa Tengah", "cluster": 2, "latitude": -7.1509, "longitude": 110.1403 },
  { "provinsi": "Nusa Tenggara Barat", "cluster": 2, "latitude": -8.6529, "longitude": 117.3616 },
  { "provinsi": "Kalimantan Selatan", "cluster": 2, "latitude": -3.0926, "longitude": 115.2838 },
  { "provinsi": "Kalimantan Timur", "cluster": 2, "latitude": 0.5387, "longitude": 116.4194 },
  { "provinsi": "Sulawesi Selatan", "cluster": 2, "latitude": -4.1449, "longitude": 119.8979 },
  { "provinsi": "Kepulauan Riau", "cluster": 3, "latitude": 3.9456, "longitude": 108.1429 },
  { "provinsi": "Nusa Tenggara Timur", "cluster": 3, "latitude": -8.6574, "longitude": 121.0794 },
  { "provinsi": "Kalimantan Tengah", "cluster": 3, "latitude": -1.6815, "longitude": 113.3824 },
  { "provinsi": "Sulawesi Tengah", "cluster": 3, "latitude": -1.4300, "longitude": 121.4456 },
  { "provinsi": "Maluku Utara", "cluster": 3, "latitude": 0.6306, "longitude": 127.9720 },
  { "provinsi": "Papua", "cluster": 3, "latitude": -4.2699, "longitude": 138.0804 },
  { "provinsi": "Jambi", "cluster": 4, "latitude": -1.6101, "longitude": 103.6131 }
];
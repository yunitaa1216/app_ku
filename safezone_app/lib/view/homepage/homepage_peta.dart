import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomepagePeta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Peta Untukmu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pemetaan');
              },
              child: Text(
                'Lihat Selengkapnya',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Raleway',
                  color: Color(0xFF1E7F1D),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        // Gunakan ClipRRect langsung tanpa Container
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0), // Border radius untuk peta
          child: SizedBox(
            height: 220, // Sesuaikan tinggi peta di sini
            width: double.infinity, // Lebar penuh
            child: PetaInteraktif(),
          ),
        ),
        // SizedBox(height: 20),
      ],
    );
  }
}

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
        return AlertDialog(
          title: Text(provinsi['provinsi']),
          content: Text('Cluster: ${provinsi['cluster']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

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
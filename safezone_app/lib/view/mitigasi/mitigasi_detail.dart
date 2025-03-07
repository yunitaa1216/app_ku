import 'package:flutter/material.dart';

class ClusterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildClusterCard(
            context: context,
            color: Color(0xFFB51E1E),
            shortText: 'Cluster 1',
            longText: 'Daerah dengan risiko bencana tinggi dan kerentanan infrastruktur.',
            clusterId: 1, // ID atau data unik untuk cluster
          ),
          SizedBox(height: 10),
          _buildClusterCard(
            context: context,
            color: Color(0xFFF8B280),
            shortText: 'Cluster 2',
            longText: 'Daerah dengan risiko bencana sedang dan kerentanan lingkungan.',
            clusterId: 2,
          ),
          SizedBox(height: 10),
          _buildClusterCard(
            context: context,
            color: Color(0xFFF9ECBD),
            shortText: 'Cluster 3',
            longText: 'Daerah dengan risiko bencana rendah dan kerentanan sosial.',
            clusterId: 3,
          ),
          SizedBox(height: 10),
          _buildClusterCard(
            context: context,
            color: Color(0xFF8EC594),
            shortText: 'Cluster 4',
            longText: 'Daerah dengan risiko bencana sangat rendah dan infrastruktur aman.',
            clusterId: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildClusterCard({
    required BuildContext context,
    required Color color,
    required String shortText,
    required String longText,
    required int clusterId,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail cluster
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClusterDetailPage(clusterId: clusterId),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Kotak warna di sebelah kiri
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(width: 12), // Jarak antara kotak warna dan teks
              // Teks di sebelah kanan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Teks pendek di atas
                    Text(
                      shortText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4), // Jarak antara teks pendek dan panjang
                    // Teks panjang di bawah
                    Text(
                      longText,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
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

// Halaman Detail Cluster
class ClusterDetailPage extends StatelessWidget {
  final int clusterId;

  const ClusterDetailPage({Key? key, required this.clusterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cluster $clusterId'),
        backgroundColor: Color(0xFFBDE1B9),
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Detail Cluster $clusterId',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ini adalah halaman detail untuk Cluster $clusterId. Anda dapat menambahkan informasi lebih lanjut di sini.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
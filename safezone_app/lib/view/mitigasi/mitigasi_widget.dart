import 'package:flutter/material.dart';

class MitigasiWidget extends StatefulWidget {
  const MitigasiWidget({Key? key}) : super(key: key);

  @override
  State<MitigasiWidget> createState() => _MitigasiWidgetState();
}

class _MitigasiWidgetState extends State<MitigasiWidget> {
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;
  Color _warna5 = Colors.white;
  Color _textColor5 = Colors.black;
  Color _warna6 = Colors.white;
  Color _textColor6 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
        children: [
          // Teks "Pemetaan Daerah Rawan"
          Text(
            'Pemetaan Daerah Rawan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5), // Jarak antara teks
          // Teks "Bencana Alam Indonesia"
          Text(
            'Bencana Alam Indonesia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10), // Jarak antara teks dan tombol
          // Tombol-tombol hijau
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Tombol Banjir
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna1 = (_warna1 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor1 = (_textColor1 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Banjir',
                    style: TextStyle(color: _textColor1, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna1),
                ),
                SizedBox(width: 10.0),
                // Tombol Gempa
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna2 = (_warna2 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor2 = (_textColor2 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Gempa',
                    style: TextStyle(color: _textColor2, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna2),
                ),
                SizedBox(width: 10.0),
                // Tombol Kebakaran Hutan
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna3 = (_warna3 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor3 = (_textColor3 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Kebakaran Hutan',
                    style: TextStyle(color: _textColor3, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna3),
                ),
                SizedBox(width: 10.0),
                // Tombol Tanah Longsor
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna4 = (_warna4 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor4 = (_textColor4 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Tanah Longsor',
                    style: TextStyle(color: _textColor4, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna4),
                ),
                SizedBox(width: 10.0),
                // Tombol Abrasi
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna5 = (_warna5 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor5 = (_textColor5 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Abrasi',
                    style: TextStyle(color: _textColor5, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna5),
                ),
                SizedBox(width: 10.0),
                // Tombol Gunung Merapi
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna6 = (_warna6 == Color(0xFF1E7F1D)) ? Colors.white : Color(0xFF1E7F1D);
                      _textColor6 = (_textColor6 == Colors.white) ? Colors.black : Colors.white;
                    });
                  },
                  child: Text(
                    'Gunung Merapi',
                    style: TextStyle(color: _textColor6, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:safezone_app/view/mitigasi/mitigasi_view.dart';
import 'package:safezone_app/view/profil/tentang_kami.dart';
import 'package:safezone_app/view/widgets/bottom_navigation_bar.dart';

class ProfilPage extends StatefulWidget {
  static PreferredSizeWidget get getAppBar {
    return AppBar(
      backgroundColor: Color(0xFFBDE1B9),
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 3.0),
            child: Text(
              'Profil',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Variabel untuk warna tombol "Keluar"
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDE1B9),
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, right: 60.0, left: 40.0),
              child: Text(
                'Profil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            // Container hijau dengan sudut melengkung
            Container(
              width: 350,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: Color(0xFF1E7F1D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/yun.jpg'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yunita Anggeraini',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'yunitaanggeraini@gmail.com',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFD1D1D1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.only(top: 20.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.info_outline, 'Mitigasi', '/informasi', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.feedback_outlined, 'Tentang Kami', '/about', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.logout_outlined, 'Keluar', null, () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 300.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFF1E7F1D),
                                        width: 2.0,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.error_rounded,
                                          color: Color(0xFF1E7F1D),
                                          size: 85,
                                        ),
                                        SizedBox(height: 16.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Oh Tidak! Anda Pergi...',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              'Apa Kamu Yakin?',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16.0),
                                        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol "Batal"
        ElevatedButton(
          onPressed: () {
            setState(() {
              isClicked = false;
            });
             Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: !isClicked ? Colors.white : Colors.green, // Warna latar tombol
            foregroundColor: !isClicked ? Colors.green : Colors.white, // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: Color(0xFF1E7F1D), // Warna tepi tombol
              width: 2.5,
            ),
          ),
          child: Text(
            'Batal',
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E7F1D)),
          ),
        ),

        // Jarak antar tombol
        SizedBox(width: 16.0),

        // Tombol "Ya, Tentu"
        ElevatedButton(
          onPressed: () {
            setState(() {
              isClicked = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isClicked ? Colors.green : Colors.white, // Warna latar tombol
            foregroundColor: isClicked ? Colors.white : Colors.green, // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: Color(0xFF1E7F1D), // Warna tepi tombol
              width: 2.5,
            ),
          ),
          child: Text(
            'Ya, Tentu',
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E7F1D),),
          ),
        ),
      ],
    ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 3,
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

  Widget buildOption(BuildContext context, IconData icon, String label, String? route, Function()? onPressed) {
    return InkWell(
      onTap: () {
        if (route == '/informasi') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MitigasiView(),
            ),
          );
        } else if (route == '/about') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Aboutme(),
            ),
          );
        } else if (onPressed != null) {
          onPressed();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              // color: iconColor,
            ),
            SizedBox(width: 16.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}

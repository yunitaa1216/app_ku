import 'package:flutter/material.dart';
import 'package:safezone_app/view/homepage/home.dart';
import 'package:safezone_app/view/login/login.dart';
import 'package:safezone_app/view/mitigasi/mitigasi_view.dart';
import 'package:safezone_app/view/pemetaan/peta.dart';
import 'package:safezone_app/view/profil/profil.dart';
import 'package:safezone_app/view/welcome_screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/mitigasi', // Halaman awal yang ditampilkan
      routes: {
        '/': (context) => WelcomeScreen(), // Halaman WelcomeScreen
        // '/login': (context) => LoginPage(), // Halaman Login
        '/homepage': (context) => HomePage(), // Halaman Home
        '/mitigasi': (context) => MitigasiView(), // Halaman Mitigasi
        '/peta': (context) => MapPage(), // Halaman Peta
        '/profil': (context) => ProfilPage(), // Halaman Profil
      },
    );
  }
}

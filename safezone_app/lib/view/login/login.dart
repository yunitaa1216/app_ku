// import 'package:flutter/material.dart';
// import 'package:safezone_sulteng/view/register/register.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _obscureText = true; // Status untuk menyembunyikan atau menampilkan password

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background putih
//           Container(
//             color: Colors.white,
//           ),
//           // Container hijau untuk bagian atas
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFF1E7F1D), // Warna hijau untuk container
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(30), // Lengkungan di bagian bawah
//                 ),
//               ),
//               height: screenHeight * 0.35, // Menetapkan tinggi 35% dari tinggi layar
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.05),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Tombol kembali
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back, color: Colors.white),
//                           onPressed: () {
//                             Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
//                           },
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     Text(
//                       'Selamat Datang!',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.03,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: 'Raleway',
//                         color: Color(0xFFF9F5F6),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.01),
//                     Text(
//                       'Masukkan Email dan Password',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.02,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: 'Raleway',
//                         color: Color(0xFFF9F5F6),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03), // Jarak antara teks dan bagian bawah container
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Card hijau muda untuk email dan password
//           Positioned(
//             top: screenHeight * 0.28, // Menempatkan card sedikit menindis container hijau
//             left: screenWidth * 0.05,
//             right: screenWidth * 0.05,
//             child: Card(
//               color: Color(0xFFBDE1B9), // Warna hijau muda untuk card
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(screenHeight * 0.02),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Email section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Email',
//                           style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.w500, color: Colors.white),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Ketik email anda disini...',
//                             hintStyle: TextStyle(color: Color(0xFFA5A5A5)), // Warna hint text
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8), // Radius border
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xFFB5B5B5), width: 2.0), // Warna border saat fokus
//                               borderRadius: BorderRadius.circular(8), // Radius border saat fokus
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xFFB5B5B5), width: 1.0), // Warna border default
//                               borderRadius: BorderRadius.circular(8), // Radius border default
//                             ),
//                             fillColor: Colors.white, // Warna latar belakang
//                             filled: true, // Pastikan fillColor diterapkan
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                       ],
//                     ),
//                     // Password section
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Password',
//                           style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold, color: Colors.white),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         TextField(
//                           obscureText: _obscureText,
//                           decoration: InputDecoration(
//                             hintText: 'Ketik password anda disini...',
//                             hintStyle: TextStyle(color: Color(0xFFA5A5A5)), // Warna hint text
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8), // Radius border
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xFFB5B5B5), width: 2.0), // Warna border saat fokus
//                               borderRadius: BorderRadius.circular(8), // Radius border saat fokus
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xFFB5B5B5), width: 1.0), // Warna border default
//                               borderRadius: BorderRadius.circular(8), // Radius border default
//                             ),
//                             fillColor: Colors.white, // Warna latar belakang
//                             filled: true, // Pastikan fillColor diterapkan
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscureText ? Icons.visibility_off : Icons.visibility,
//                                 color: Color(0xFFA5A5A5),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscureText = !_obscureText; // Toggle visibility
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Login button
//           Positioned(
//             bottom: screenHeight * 0.24,
//             left: screenWidth * 0.05,
//             right: screenWidth * 0.05,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Tambahkan logika untuk proses login di sini
//                 print('Tombol Login ditekan');
//                 Navigator.pushNamed(context, '/homepage');
//               },
//               child: Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, screenHeight * 0.07), // Lebar penuh tombol
//                 backgroundColor: Color(0xFF1E7F1D), // Warna latar belakang tombol
//                 foregroundColor: Colors.white, // Warna teks tombol
//               ),
//             ),
//           ),
//           // Komponen DonTHaveAnAccountSignUp
//           Positioned(
//             bottom: screenHeight * 0.12,
//             left: screenWidth * 0.05,
//             right: screenWidth * 0.05,
//             child: DonTHaveAnAccountSignUp(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Class DonTHaveAnAccountSignUp
// class DonTHaveAnAccountSignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "Belum punya akun?",
//           style: TextStyle(
//             color: Color(0xFF1E7F1D),
//             fontSize: 14,
//             fontFamily: 'Raleway',
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => RegisterPage(), // Pastikan ada halaman Register
//               ),
//             );
//           },
//           child: const Text(
//             'Register',
//             style: TextStyle(
//               color: Color(0xFF000000),
//               fontSize: 14,
//               fontFamily: 'Raleway',
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
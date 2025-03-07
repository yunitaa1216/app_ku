import 'package:flutter/material.dart';
import 'package:safezone_app/view/homepage/home.dart';
// import 'package:safezone_sulteng/view/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding1.dart'; // Import slide 1
import 'onboarding2.dart'; // Import slide 2
import 'onboarding3.dart'; // Import slide 3

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final page = _controller.page?.round() ?? 0;
      if (_currentPage.value != page) {
        _currentPage.value = page;
      }
    });
  }

  void _nextPage() {
    if (_currentPage.value == _totalPages - 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih untuk seluruh Scaffold
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
              ],
            ),
          ),
          Container(
            color: Colors.white, // Latar belakang putih untuk area titik-titik dan tombol
            child: Column(
              mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran kolom
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: _totalPages,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      dotColor: Colors.grey, // Ubah jika perlu
                      activeDotColor: Color(0xFF1E7F1D),
                      dotHeight: screenWidth * 0.03,
                      dotWidth: screenWidth * 0.03,
                      spacing: 8,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.05, right: screenWidth * 0.05),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ValueListenableBuilder<int>(
                      valueListenable: _currentPage,
                      builder: (context, currentPage, child) {
                        return ElevatedButton(
                          onPressed: _nextPage,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1E7F1D)), // Mengatur warna latar belakang tombol menjadi hijau
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Mengatur warna teks tombol menjadi putih
                            elevation: MaterialStateProperty.all<double>(0), // Menghilangkan bayangan tombol jika diinginkan
                            minimumSize: MaterialStateProperty.all<Size>(Size(screenWidth * 0.4, screenHeight * 0.06)), // Mengatur ukuran tombol
                          ),
                          child: Text(
                            currentPage == _totalPages - 1 ? 'Mulai' : 'Selanjutnya',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _currentPage.dispose();
    super.dispose();
  }
}
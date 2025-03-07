import 'package:flutter/material.dart';
// import 'package:your_app/navigation_service.dart';
// import 'article_page.dart'; // Impor halaman artikel

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MyBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'Info',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.note_alt_outlined),
        //   label: 'Booking',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Peta',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFF73C072),
      unselectedItemColor: Colors.grey,
      iconSize: 24,
      onTap: onItemTapped,
    );
  }
}

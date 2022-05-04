import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/pages/dependent/dependent.dart';
import 'package:my_khairat/pages/home/home.dart';
import 'package:my_khairat/pages/setting/profile.dart';
import 'package:my_khairat/styles/app_color.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'MyKhairat',
          style: TextStyle(color: AppColor.primary),
        ),
      ),
      body: IndexedStack(
        index: indexPage,
        children: const [
          Home(),
          Dependent(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        selectedItemColor: AppColor.primary,
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.grid),
              icon: Icon(Ionicons.grid_outline),
              label: 'Halaman Utama'),
          BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.people),
              icon: Icon(Ionicons.people_outline),
              label: 'Tanggungan'),
          BottomNavigationBarItem(
              activeIcon: Icon(Ionicons.person),
              icon: Icon(Ionicons.person_outline),
              label: 'Profile'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        selectedItemColor: AppColor.primary,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Home'),
        ],
      ),
    );
  }
}

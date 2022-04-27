import 'package:flutter/material.dart';
import 'package:my_khairat/pages/dependent/dependent.dart';
import 'package:my_khairat/pages/payment/payment.dart';
import 'package:my_khairat/pages/setting/setting.dart';
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
          Payment(),
          Dependent(),
          Setting(),
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
              icon: Icon(Icons.payment_outlined), label: 'Pembayaran'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Tanggungan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Tetapan'),
        ],
      ),
    );
  }
}

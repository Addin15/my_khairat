import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/pages/home/create_payment.dart';
import 'package:my_khairat/pages/home/money_claim.dart';
import 'package:my_khairat/pages/home/payment_history.dart';
import 'package:my_khairat/styles/app_color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          log('refresh');
        },
        child: ListView(
          //physics: const RangeMaintainingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.primary,
                        AppColor.secondary,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Masjid A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kampung B',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Yuran Tertunggak',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'RM30.00',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 130,
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                ),
                children: [
                  ShowBox(
                    icon: 'assets/icons/bayar.png',
                    label: 'Buat\nPembayaran',
                    onTap: () {
                      log('bayar');
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const CreatePayment()));
                    },
                  ),
                  ShowBox(
                    icon: 'assets/icons/resit.png',
                    label: 'Sejarah\nPembayaran',
                    onTap: () {
                      log('sejarah');
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const PaymentHistory()));
                    },
                  ),
                  ShowBox(
                    icon: 'assets/icons/tuntutan.png',
                    label: 'Tuntutan\nWang',
                    onTap: () {
                      log('tuntut');
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const MoneyClaim()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pengunguman',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class ShowBox extends StatelessWidget {
  const ShowBox({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  icon,
                  color: AppColor.primary,
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/pages/home/create_payment.dart';
import 'package:my_khairat/pages/home/money_claim.dart';
import 'package:my_khairat/pages/home/payment_history.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Announcement Carousel
  final CarouselController _carouselController = CarouselController();
  int selectedAnnouncement = 0;
  List<Widget> announcements = [
    AnnouncementBox(
      title: 'Title 1',
      announcement:
          'Announcement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\nAnnouncement 1\n',
      date: DateTime.now(),
    ),
    AnnouncementBox(
      title: 'Title 2',
      announcement: 'Announcement 2',
      imgUrl:
          'https://zamzam-blog.s3.eu-west-1.amazonaws.com/wp-content/uploads/2022/02/MicrosoftTeams-image-3-1.png',
      date: DateTime.now(),
    ),
    AnnouncementBox(
      title: 'Title 3',
      announcement: 'Announcement 3',
      date: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      body: ListView(
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
                      'Masjid Setapak',
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
                MenuBox(
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
                MenuBox(
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
                MenuBox(
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
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pengumuman',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CarouselSlider(
                carouselController: _carouselController,
                items: announcements,
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedAnnouncement = index;
                      });
                    }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: announcements.map((url) {
              int index = announcements.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedAnnouncement == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  const MenuBox({
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

class AnnouncementBox extends StatelessWidget {
  const AnnouncementBox({
    this.title,
    this.imgUrl,
    this.announcement,
    this.date,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? imgUrl;
  final String? announcement;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xF1DDDDDD),
        border: Border.all(
          color: const Color(0xF1C1C1C1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      child: Stack(
        alignment: Alignment.topLeft,
        fit: StackFit.expand,
        children: [
          imgUrl == null || imgUrl!.isEmpty
              ? Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Text(
                    announcement!,
                    maxLines: 7,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imgUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.overlay,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white24,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              alignment: Alignment.topCenter,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.overlay,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white24,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 13, bottom: 5),
                    child: Text(DateFormat('dd-MM-yyyy').format(date!)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 13, bottom: 5),
                    child: Text(
                      'Baca Lagi...',
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

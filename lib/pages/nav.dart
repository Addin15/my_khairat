import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/announcement_dao.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/announcement.dart';
import 'package:my_khairat/models/person.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/pages/account_unverified.dart';
import 'package:my_khairat/pages/auth/login.dart';
import 'package:my_khairat/pages/complete_profile.dart';
import 'package:my_khairat/pages/dependent/dependent.dart';
import 'package:my_khairat/pages/home/guest_home.dart';
import 'package:my_khairat/pages/home/home.dart';
import 'package:my_khairat/pages/setting/profile.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int indexPage = 0;

  backtoHome() {
    setState(() {
      indexPage = 0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserDAO>(
      create: (context) => UserDAO(),
      child: Consumer<UserDAO>(builder: (context, userDAO, child) {
        User? user = userDAO.user;

        return ChangeNotifierProvider<DependentDAO>(
          create: (context) => DependentDAO(user!.personID!),
          child: Scaffold(
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
              children: [
                user == null
                    ? const GuestHome()
                    : user.mosqueID == null ||
                            user.mosqueID!.isEmpty ||
                            user.status == 'pending'
                        ? const GuestHome()
                        : Home(userDAO: userDAO),
                user?.personID != null ? Dependent(userDAO: userDAO) : Text(""),
                Profile(userDAO: userDAO, backToHome: backtoHome),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: indexPage,
              selectedFontSize: 3.w,
              unselectedFontSize: 3.w,
              iconSize: 6.w,
              selectedItemColor: AppColor.primary,
              onTap: (index) {
                if (index != 0) {
                  if (user == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(userDAO: userDAO)));
                  } else if (user.name == null || user.name!.isEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CompleteProfile(userDAO: userDAO)));
                  } else if (user.status == 'rejected') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompleteProfile(
                                  userDAO: userDAO,
                                  isRejected: true,
                                )));
                  } else if (user.status == 'pending') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AccountUnverified(userDAO: userDAO)));
                  } else {
                    setState(() {
                      indexPage = index;
                    });
                  }
                } else {
                  setState(() {
                    indexPage = index;
                  });
                }
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
          ),
        );
      }),
    );
  }
}

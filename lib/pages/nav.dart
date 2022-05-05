import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/models/person.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/pages/dependent/dependent.dart';
import 'package:my_khairat/pages/home/home.dart';
import 'package:my_khairat/pages/setting/profile.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:provider/provider.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  late final User user;
  int indexPage = 0;

  getUserDummy() {
    List<Person> dependents = [
      Person(
        name: 'Dependent 1',
        ic: '0062691209',
        address: 'A',
        phone: '0126253424',
        occupation: 'Pelajar',
      ),
      Person(
        name: 'Dependent 2',
        ic: '0062691209',
        address: 'A',
        phone: '0126253424',
        occupation: 'Pelajar',
      ),
      Person(
        name: 'Dependent 3',
        ic: '0062691209',
        address: 'A',
        phone: '0126253424',
        occupation: 'Pelajar',
      ),
    ];

    Map<String, dynamic> userMap = {
      'name': 'TestUser',
      'ic': '000713100567',
      'address': 'KL',
      'phone': '0123456789',
      'occupation': 'Lecturer',
      'id': '1',
      'email': 'test@gmail.com',
    };

    User dummyUser = User.fromMap(userMap);
    dummyUser.dependents = dependents;

    setState(() {
      user = dummyUser;
    });
  }

  @override
  void initState() {
    getUserDummy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<User>.value(
        value: user,
        builder: (context, child) {
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
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/pages/setting/edit_profile.dart';
import 'package:my_khairat/styles/app_color.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.primary, width: 3),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                    child: const Text(
                      "Profil",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.primary, width: 3),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.help,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                    child: const Text(
                      "Bantuan",
                      style: TextStyle(color: Colors.black),
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

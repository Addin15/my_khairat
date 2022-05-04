import 'package:flutter/material.dart';
import 'package:my_khairat/main.dart';
import 'package:my_khairat/pages/complete_profile.dart';
import 'package:my_khairat/pages/payment/payment.dart';
import 'package:my_khairat/pages/setting/edit_profile.dart';
import 'package:my_khairat/styles/app_color.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 80,
            child: Card(
              color: AppColor.primary,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text("Profil", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 80,
            child: Card(
              color: Colors.redAccent,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Text(
                      "Keluar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

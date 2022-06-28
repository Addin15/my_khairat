import 'package:flutter/material.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class AccountUnverified extends StatefulWidget {
  const AccountUnverified({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<AccountUnverified> createState() => _AccountUnverifiedState();
}

class _AccountUnverifiedState extends State<AccountUnverified> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar:
            customAppBar(context: context, title: const Text('Tidak Disahkan')),
        body: Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/forbidden.png',
                width: 50.sp,
                height: 50.sp,
              ),
              SizedBox(height: 2.h),
              Text(
                'Akaun anda belum disahkan',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 2.h),
              customTextButton(
                label: 'Log Keluar',
                onPressed: () {},
                backgroundColor: Colors.red,
                borderColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

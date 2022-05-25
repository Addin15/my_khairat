import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({required this.userDAO, required this.backToHome, Key? key})
      : super(key: key);

  final UserDAO userDAO;
  final Function() backToHome;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User? user = widget.userDAO.user;

    if (user == null) {
      return Container(
          color: Colors.white,
          child: SpinKitChasingDots(
            color: AppColor.primary,
          ));
    } else {
      return Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
                decoration: BoxDecoration(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.sp,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${user.name}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        const Icon(
                          Ionicons.shield_checkmark_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      '${user.id}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              // Setting buttons
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.w),
                                  color: Colors.blue,
                                ),
                                padding: EdgeInsets.all(2.w),
                                child: Icon(
                                  Ionicons.help_outline,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Text(
                                  'Bantuan',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Icon(
                                Ionicons.chevron_forward,
                                size: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.w),
                                  color: Colors.pink,
                                ),
                                padding: EdgeInsets.all(2.w),
                                child: Icon(
                                  Ionicons.information_outline,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Text(
                                  'Soalan Lazim',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Icon(
                                Ionicons.chevron_forward,
                                size: 14.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          // LOGOUT
                          widget.backToHome();
                          await widget.userDAO.logout();
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.w),
                                color: Colors.red,
                              ),
                              padding: EdgeInsets.all(2.w),
                              child: Icon(
                                Ionicons.log_out_outline,
                                color: Colors.white,
                                size: 14.sp,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Text(
                                'Log Keluar',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Icon(
                              Ionicons.chevron_forward,
                              size: 14.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

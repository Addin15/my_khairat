import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/guest_dao.dart';
import 'package:my_khairat/DAO/mosque_dao.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/pages/home/announcement/announcement_list.dart';
import 'package:my_khairat/pages/home/announcement/view_announcement.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GuestHome extends StatefulWidget {
  const GuestHome({Key? key}) : super(key: key);

  @override
  State<GuestHome> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GuestDAO(),
      child: Consumer<GuestDAO>(
        builder: (context, guestDAO, child) {
          Mosque? mosque = guestDAO.mosque;
          return Consumer<MosqueDAO>(
            builder: (context, mosqueDAO, child) {
              List<Mosque> mosques = mosqueDAO.mosques;
              log(mosques.length.toString());
              return Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          List<Mosque> searched = [];
                          showDialog(
                            context: context,
                            builder: (context) =>
                                StatefulBuilder(builder: (context, setState) {
                              return Dialog(
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 2.h),
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        Text(
                                          'Pilih Masjid',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        customTextFormField(
                                          hintText: 'Cari...',
                                          icon: Ionicons.search,
                                          controller: _searchController,
                                          focusNode: _searchFocus,
                                          onChanged: (val) {
                                            if (val.isEmpty) {
                                              setState(() => searched.clear());
                                            } else {
                                              List<Mosque> data = mosques
                                                  .where((m) => m.name!
                                                      .toLowerCase()
                                                      .contains(
                                                          val.toLowerCase()))
                                                  .toList();
                                              setState(() => searched = data);
                                            }
                                          },
                                        ),
                                        SizedBox(height: 2.h),
                                        ...searched.map((s) {
                                          return GestureDetector(
                                            onTap: () {
                                              guestDAO.setMosque(s);
                                              Navigator.pop(context);
                                            },
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp)),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w,
                                                    vertical: 2.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp)),
                                                child: Text(
                                                  s.name!,
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList()
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
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
                              children: [
                                Text(
                                  mosque == null
                                      ? 'Sila Pilih Masjid'
                                      : mosque.name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 1.w),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    mosque == null
                        ? const SizedBox.shrink()
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Pengumuman',
                                      style: TextStyle(fontSize: 12.sp),
                                    )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      AnnouncementList(
                                                          announcements: guestDAO
                                                              .announcements)));
                                        },
                                        child: Text(
                                          'Lihat Semua',
                                          style: TextStyle(fontSize: 12.sp),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                ...guestDAO.announcements.take(5).map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAnnouncement(
                                                      announcement: e)));
                                    },
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 2.h),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(DateFormat(
                                                      'dd-MM-yyyy')
                                                  .format(
                                                      DateTime.parse(e.date!))),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                e.title!,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()
                              ],
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

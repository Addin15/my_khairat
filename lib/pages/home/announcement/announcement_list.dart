import 'package:flutter/material.dart';
import 'package:my_khairat/models/announcement.dart';
import 'package:my_khairat/pages/home/announcement/view_announcement.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({required this.announcements, Key? key})
      : super(key: key);

  final List<Announcement> announcements;

  @override
  Widget build(BuildContext context) {
    announcements.sort(
        (a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: Text(
          'Pengumuman',
          style: TextStyle(
            color: AppColor.primary,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            ...announcements.map((announcement) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewAnnouncement(announcement: announcement)));
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            announcement.date!,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Text(
                          announcement.title!,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

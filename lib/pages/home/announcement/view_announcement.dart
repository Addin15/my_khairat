import 'package:flutter/material.dart';
import 'package:my_khairat/config/config.dart';
import 'package:my_khairat/models/announcement.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class ViewAnnouncement extends StatefulWidget {
  const ViewAnnouncement({required this.announcement, Key? key})
      : super(key: key);

  final Announcement announcement;

  @override
  State<ViewAnnouncement> createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: Text(
            'Pengumuman',
            style: TextStyle(
              color: AppColor.primary,
            ),
          )),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.sp)),
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  widget.announcement.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widget.announcement.imgURL == null
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          SizedBox(height: 2.h),
                          Image.network(
                              Config.host + widget.announcement.imgURL!),
                        ],
                      ),
                SizedBox(height: 2.h),
                Text(widget.announcement.content!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

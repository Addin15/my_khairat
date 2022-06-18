import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class ViewDeadDependent extends StatefulWidget {
  const ViewDeadDependent({Key? key, required this.dependentDAO, required this.dependent}) : super(key: key);

  final DependentDAO dependentDAO;
  final DependentModel dependent;

  @override
  State<ViewDeadDependent> createState() => _ViewDeadDependent();
}

class _ViewDeadDependent extends State<ViewDeadDependent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: Text(
          'Rekod Tanggungan',
          style: TextStyle(
            color: AppColor.primary,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(1.h),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 2,
                color: Colors.white,
                shadowColor: Colors.black,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama seperti Kad Pengenalan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_name!,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Hubungan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_relation!,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "No. Kad Pengenalan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_ic!,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "No. Telefon",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_phone ?? "N/A",
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Pekerjaan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_occupation ?? "N/A",
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Alamat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.dependent_address ?? "N/A",
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Status Kematian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.death_status!,
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Tarikh Kematian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.dependent.death_date ?? "N/A",
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Lokasi Kubur",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "BRP123",
                            style: TextStyle(color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          
                  ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
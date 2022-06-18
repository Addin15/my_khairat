import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/pages/nav2.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../DAO/dependent_dao.dart';
import '../../models/dependent.dart';

class UpdateDependent extends StatefulWidget {
  const UpdateDependent({required this.dependentDAO, required this.dependent,  Key? key})
      : super(key: key);

  final DependentDAO dependentDAO;
  final DependentModel dependent;


  @override
  State<UpdateDependent> createState() => _UpdateDependentState();
}

class _UpdateDependentState extends State<UpdateDependent> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _phoneController.text = widget.dependent.dependent_phone ?? "";
    _occupationController.text = widget.dependent.dependent_occupation ?? "";
    _addressController.text = widget.dependent.dependent_address ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: Text(
          'Kemaskini Maklumat Tanggungan',
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
                            TextField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
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
                            TextField(
                              controller: _occupationController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
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
                            TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
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
                              "N/A",
                              style: TextStyle(color: Colors.black),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height:5.5.h, //height of button
                              width:double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  widget.dependent.dependent_phone = _phoneController.text;
                                  widget.dependent.dependent_occupation = _occupationController.text;
                                  widget.dependent.dependent_address = _addressController.text;
                                  await widget.dependentDAO.editDependent(widget.dependent);

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => Nav2()));

                                },
                                child: Text("Kemaskini"),
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(AppColor.primary),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h)),
                                  ),
                                ),
                              ),
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

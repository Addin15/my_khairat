import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/pages/dependent/dependent.dart';
import 'package:my_khairat/pages/dependent/update_dependent.dart';
import 'package:my_khairat/pages/dependent/view_dead_dependent.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';

class ViewDependent extends StatefulWidget {
  const ViewDependent(
      {Key? key, required this.dependentDAO, required this.dependent})
      : super(key: key);

  final DependentDAO dependentDAO;
  final DependentModel dependent;

  @override
  State<ViewDependent> createState() => _ViewDependentState();
}

confirmDeletePopup({
  required BuildContext context,
  required String title,
  required Widget content,
}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.sp),
    ),
    alignment: Alignment.center,
    title: Text(
      title,
      textAlign: TextAlign.center,
    ),
    content: content,
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      customTextButton(
        label: 'Batal',
        labelColor: AppColor.primary,
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pop(context, false),
      ),
      customTextButton(
        label: 'Buang',
        backgroundColor: Colors.red,
        borderColor: Colors.red,
        onPressed: () => Navigator.pop(context, true),
      ),
    ],
  );
}

class _ViewDependentState extends State<ViewDependent> {
  late DependentModel dependent;

  @override
  void initState() {
    dependent = widget.dependent;
    super.initState();
  }

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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_name!,
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_relation!,
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_ic!,
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_phone ?? "N/A",
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_occupation ?? "N/A",
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            dependent.dependent_address ?? "N/A",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.5.h, //height of button
                                width: 20.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    DependentModel? data = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateDependent(
                                              dependentDAO: widget.dependentDAO,
                                              dependent: dependent),
                                        ));

                                    if (data != null) {
                                      setState(() {
                                        dependent = data;
                                      });
                                    }
                                  },
                                  child: Text("Kemaskini"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColor.primary),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.h)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              SizedBox(
                                height: 5.5.h, //height of button
                                width: 20.h, //width of button
                                child: ElevatedButton(
                                  onPressed: () async {
                                    dynamic res = await showDialog(
                                      context: context,
                                      builder: (context) => confirmDeletePopup(
                                        context: context,
                                        title:
                                            'Anda pasti untuk buang tanggungan ini dari senarai?',
                                        content: Text(
                                          dependent.dependent_name!,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );

                                    if (res != null) {
                                      if (res) {
                                        await widget.dependentDAO
                                            .deleteDependent(dependent);
                                        Navigator.pop(context);
                                      }
                                    }
                                  },
                                  child: Text("Padam"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.red[800]),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.h)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10, //height of button
                            width: 100,
                          ),
                          SizedBox(
                            height: 45, //height of button
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                            'Lapor Kematian',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFF0EAD69)),
                                          ),
                                          content: Text(
                                              '1. Jika pengebumian berlaku di dalam kawasan kariah masjid, sila hubungi pihak masjid \n\n2. Jika pengebumian berlaku di luar kawasan, sila ke Halaman Utama untuk Tuntutan Wang. Sediakan: \n\n\t\t\t\t\t\ta. Surat Kematian'),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: Color(0xFF0EAD69)),
                                                ))
                                          ],
                                        ));
                              },
                              child: Text("Lapor Kematian"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 244, 191, 87)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.h)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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

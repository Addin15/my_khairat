import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/app_color.dart';

//the UI for now
class ReportDeath extends StatefulWidget {
  const ReportDeath(
      {
      // required this.userDAO,
      Key? key})
      : super(key: key);

  // final UserDAO userDAO;

  @override
  State<ReportDeath> createState() => _ReportDeathState();
}

class _ReportDeathState extends State<ReportDeath> {
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController deathdate = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController causes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lapor Kematian Tanggungan',
          style: TextStyle(color: AppColor.primary),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Ionicons.chevron_back),
          color: AppColor.primary,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(1.h),
          width: double.infinity,
          child: Card(
            elevation: 2,
            color: Colors.white,
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  heightFactor: 1.5,
                  child: Icon(
                    Ionicons.person_circle_sharp,
                    size: 60,
                    color: Color(0xFF616161),
                    //color: Color(0xFF424242),
                    //color: Colors.grey.shade800 ,
                    //color: Color.fromRGBO(22, 18, 184, .7),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Nama'),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              SizedBox(
                                width: 160,
                                // child: Expanded(
                                child: TextField(
                                  enabled: false,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Safraa Khairunnisa binti Rahim',
                                      border: InputBorder.none),
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.phone,
                                ),
                                // ),
                              ),
                              // Text(
                              //   'Nurul Aina binti Ariffin',
                              //   maxLines: 1,
                              //   softWrap: false,
                              //   overflow: TextOverflow.visible,
                              //   style: TextStyle(color: Colors.grey),
                              // ),
                              Icon(
                                Ionicons.lock_closed_outline,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          // Flexible(
                          //   child: Row(
                          //     // mainAxisAlignment: MainAxisAlignment.end,
                          //     children: const [
                          //       Text(
                          //         'Nurul Aina binti Ariffin',
                          //         maxLines: 1,
                          //         softWrap: false,
                          //         overflow: TextOverflow.visible,
                          //         style: TextStyle(color: Colors.grey),
                          //       ),
                          //       Icon(
                          //         Ionicons.lock_closed_outline,
                          //         color: Colors.grey,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'No. Kad \nPengenalan',
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                '800233101234',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(
                                Ionicons.lock_closed_outline,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Hubungan',
                          ),
                          Text(
                            'Isteri',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Ionicons.lock_closed_outline,
                            color: Colors.grey,
                          ),
                          //         Row(
                          //   // mainAxisAlignment: MainAxisAlignment.start,
                          //   children: const [
                          //     Text(
                          //       'Isteri',
                          //       style: TextStyle(color: Colors.grey),
                          //     ),
                          //     Icon(
                          //       Ionicons.lock_closed_outline,
                          //       color: Colors.grey,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'No. Telefon',
                          ),
                          // Text('+60190001100'),
                          SizedBox(
                            width: 170,
                            // child: Expanded(
                            child: TextField(
                              controller: phoneNo,
                              decoration: const InputDecoration(
                                hintText: '+60190001100',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0EAD69))),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              // onChanged: (value) {
                              //   setState(() {
                              //     phoneNo.text = value.toString();
                              //   });
                              // },
                            ),
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Alamat',
                          ),
                          // Text('+60190001100'),
                          SizedBox(
                            width: 170,
                            // child: Expanded(
                            child: TextField(
                              controller: address,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText:
                                    'No. 36, Jalan Lurah Said Satu, Taman Dahlia, Kampung Delek Kanan, 41250, Klang, Selangor',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0EAD69))),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              // onChanged: (value) {
                              //   setState(() {
                              //     phoneNo.text = value.toString();
                              //   });
                              // },
                            ),
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tarikh \nMeninggal',
                          ),
                          // Text('+60190001100'),
                          SizedBox(
                            width: 170,
                            // child: Expanded(
                            child: TextField(
                              controller: deathdate,
                              decoration: const InputDecoration(
                                hintText: '13 Jun 2005',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0EAD69))),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.datetime,
                              // onChanged: (value) {
                              //   setState(() {
                              //     phoneNo.text = value.toString();
                              //   });
                              // },
                            ),
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tempat',
                          ),
                          SizedBox(
                            width: 170,
                            child: TextField(
                              controller: location,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Hospital Semenyih',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0EAD69))),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              // onChanged: (value) {
                              //   setState(() {
                              //     phoneNo.text = value.toString();
                              //   });
                              // },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sebab-sebab\nMeninggal',
                          ),
                          SizedBox(
                            width: 170,
                            child: TextField(
                              controller: causes,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Kemalangan',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF0EAD69))),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              // onChanged: (value) {
                              //   setState(() {
                              //     phoneNo.text = value.toString();
                              //   });
                              // },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      label: const Text('Lapor'),
                      icon: const Icon(Ionicons.reader_outline),
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class ViewDependent extends StatefulWidget {
  const ViewDependent({Key? key}) : super(key: key);

  

  @override
  State<ViewDependent> createState() => _ViewDependentState();
}

class _ViewDependentState extends State<ViewDependent> {
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
                            "Nama seperti IC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Ahmad Najmi Bin Abdul Halim",
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
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Anak",
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
                            "NO IC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "001123-12-1211",
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
                            "No Telefon",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "0179035651",
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
                            "Pekerjaan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Pelajar",
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
                            "Alamat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Dungun, Terengganu",
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
                            "Status Kematian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "N/A",
                            style: TextStyle(color: Colors.grey),
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
                          /*GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context, builder: (_) => ImageDialog());
                            },
                            child: Image.network(
                              'https://i.pinimg.com/236x/f7/2c/7e/f72c7e5e75ae1737feff8ef29d34cc73.jpg',
                              height: 30.h,
                              fit: BoxFit.fill,
                            ),
                          ),*/
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:45, //height of button
                                width:130, 
                                child: ElevatedButton(
                                  onPressed: () {},
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
                              SizedBox(
                                height:45, //height of button
                                width:130, //width of button
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Padam"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red[800]),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1.h)),
                                    
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            
                          ),
                          SizedBox(
                            height:10, //height of button
                            width:100, 
                          ),
                          SizedBox(
                                height:45, //height of button
                                width:double.infinity, 
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Lapor Kematian"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color.fromARGB(255, 244, 191, 87)),
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
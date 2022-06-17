import 'dart:developer';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:my_khairat/pages/dependent/view_dependent.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../models/user.dart';
import '../../styles/custom_text_button.dart';
import 'add_dependent.dart';


class Dependent extends StatefulWidget {
  const Dependent({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<Dependent> createState() => _DependentState();
}


class _DependentState extends State<Dependent> {
  @override
  Widget build(BuildContext context) {
    User user = widget.userDAO.user;

    return ChangeNotifierProvider<DependentDAO>(
      create: (context) => DependentDAO(user.personID!),
      child: Consumer<DependentDAO>(builder: (context, dependentDAO, child) {
        List<DependentModel> dependents = dependentDAO.dependents;
        return Scaffold(
          body: Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: [
                Text(
                  'Senarai Tanggungan',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),


                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: dependents.length,
                    separatorBuilder: (context, index) => SizedBox(height: 1.h),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            CupertinoPageRoute(
                             builder: (context) => ViewDependent(dependentDAO: dependentDAO, dependent: dependents[index],),
                            ));
},
                          child: Card(
                            
                            color: dependents[index].death_status==null ? Colors.white : Colors.grey,
                            elevation: 5,
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                              
                            ),
                            
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              padding: EdgeInsets.only(
                                left: 5.w,
                                top: 2.h,
                                bottom: 2.h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      dependents[index].dependent_name!,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  (dependents[index].dependent_address == null||dependents[index].dependent_occupation == null||dependents[index].dependent_phone == null) ? new Text(
                                "*Data Tidak Lengkap",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                        
                                    fontStyle: FontStyle.italic
                                ),
                              ) : new Text(''),
                                  SizedBox(width: 30,),
                        
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primary,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => AddDependent(
                            userID: user.personID!,
                            dependentDAO: dependentDAO,
                          )));
            },
          ),
        );
      }),
    );


  }
}

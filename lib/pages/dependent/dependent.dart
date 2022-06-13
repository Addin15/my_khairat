import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import 'add_dependent.dart';

class Dependent extends StatefulWidget {
  const Dependent({this.userDAO, Key? key}) : super(key: key);

  final UserDAO? userDAO;

  @override
  State<Dependent> createState() => _DependentState();
}

class _DependentState extends State<Dependent> {
  @override
  Widget build(BuildContext context) {
    User user = widget.userDAO?.user;
    if (user.personID == null) {
      return Text('personID is null');
    } else {
      return ChangeNotifierProvider<DependentDAO>(
        create: (context) => DependentDAO(user.personID!.toString()),
        child: Consumer<DependentDAO>(builder: (context, dependentDAO, child) {
          List<DependentModel> dependents = dependentDAO.dependents;

          return Scaffold(
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

/*    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => AddDependent(
                      userID: widget.userID,
                      dependentDAO: dependentDAO,
                    )));
            },
    ),);*/
  }
}

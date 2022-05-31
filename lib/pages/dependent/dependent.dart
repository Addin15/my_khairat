import 'package:flutter/material.dart';
import 'package:my_khairat/DAO/user_dao.dart';
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
    return Scaffold(body:Center(child: RaisedButton(onPressed: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>AddDependent()));
    }, child: Text('Add Dependent'),),));
  }
}

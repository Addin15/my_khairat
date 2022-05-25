import 'package:flutter/material.dart';
import 'package:my_khairat/DAO/user_dao.dart';

class Dependent extends StatefulWidget {
  const Dependent({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<Dependent> createState() => _DependentState();
}

class _DependentState extends State<Dependent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

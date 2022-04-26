import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_khairat/pages/auth/login.dart';
import 'package:my_khairat/pages/auth/register.dart';
import 'package:my_khairat/pages/complete_profile.dart';

import 'pages/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: const Nav(),
    );
  }
}

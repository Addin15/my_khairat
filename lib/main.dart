import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_khairat/DAO/mosque_dao.dart';
import 'package:my_khairat/models/person.dart';
import 'package:my_khairat/models/user.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'pages/nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..init
    ..registerAdapter(UserAdapter())
    ..registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MosqueDAO()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme)
                .apply(fontSizeDelta: 1.w),
          ),
          home: const Nav(),
        ),
      );
    });
  }
}

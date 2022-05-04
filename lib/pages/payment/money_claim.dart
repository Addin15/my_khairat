import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';

class MoneyClaim extends StatefulWidget {
  const MoneyClaim({Key? key}) : super(key: key);

  @override
  State<MoneyClaim> createState() => _MoneyClaimState();
}

class _MoneyClaimState extends State<MoneyClaim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tuntutan Wang',
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
    );
  }
}

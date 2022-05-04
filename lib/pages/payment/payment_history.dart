import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sejarah Pembayaran',
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

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';

class CreatePayment extends StatefulWidget {
  const CreatePayment({Key? key}) : super(key: key);

  @override
  State<CreatePayment> createState() => _CreatePaymentState();
}

class _CreatePaymentState extends State<CreatePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Buat Pembayaran',
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

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class PaymentReceived extends StatefulWidget {
  @override
  _PaymentReceivedState createState() => _PaymentReceivedState();
}

class _PaymentReceivedState extends State<PaymentReceived> {
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
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColor.primary,
                      AppColor.secondary,
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                width: 90.w,
                height: 55.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Transaksi Baharu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Icon(
                      Icons.price_check,
                      color: Colors.white,
                      size: 100.0.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Resit pembayaran berjaya dimuat naik. Pengesahan resit akan dilakukan dalam masa 3 hari bekerja ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Terima Kasih!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    customTextButton(
                        label: 'Ke Halaman Utama',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }),
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

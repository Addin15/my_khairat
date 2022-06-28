import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/payment_dao.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/payment.dart';
import 'package:my_khairat/pages/home/Payment/payment_received.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:sizer/sizer.dart';

class CreatePayment extends StatefulWidget {
  const CreatePayment({
    required this.userID,
    required this.paymentDAO,
    required this.mosque,
    Key? key,
  }) : super(key: key);

  final String userID;
  final PaymentDAO paymentDAO;
  final Mosque mosque;

  @override
  State<CreatePayment> createState() => _CreatePaymentState();
}

class _CreatePaymentState extends State<CreatePayment> {
  XFile? image;

  String? error;

  bool isLoading = false;

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
      body: Stack(
        children: [
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  error == null
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Text(
                              error!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 2.h),
                          ],
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    width: 90.w,
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
                          height: 8.h,
                        ),
                        Text(
                          "RM${widget.mosque.monthlyFee!.toStringAsFixed(2)}/sebulan",
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
                          "Bank: ${widget.mosque.bankName}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Nama Pemilik Bank: ${widget.mosque.bankOwnerName}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "No Bank: ${widget.mosque.bankAccountNo}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "SILA MUATNAIK RESIT PEMBAYARAN ANDA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 5.h,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                            ),
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              size: 18.sp,
                            ),
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();

                              await showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  insetPadding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 10.w,
                                  ),
                                  child: SizedBox(
                                    height: 10.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                XFile? file =
                                                    await imagePicker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                Navigator.pop(context);

                                                if (mounted && file != null) {
                                                  setState(() {
                                                    image = file;
                                                  });
                                                }
                                              },
                                              icon:
                                                  Icon(Ionicons.camera_outline),
                                            ),
                                            Text('Kamera'),
                                          ],
                                        ),
                                        SizedBox(width: 2.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                XFile? file =
                                                    await imagePicker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                Navigator.pop(context);

                                                if (mounted && file != null) {
                                                  setState(() {
                                                    image = file;
                                                  });
                                                }
                                              },
                                              icon:
                                                  Icon(Ionicons.image_outline),
                                            ),
                                            Text('Galeri'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            label: Text(
                              'Tambah Gambar',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        image != null
                            ? Text(
                                image!.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(height: 5.h),
                        customTextButton(
                            label: 'Muat Naik',
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              if (image != null) {
                                bool res = await widget.paymentDAO
                                    .makePayment(widget.userID, image!);

                                if (res) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentReceived()),
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                    error = 'Gagal memuatnaik gambar';
                                  });
                                }
                              } else {
                                setState(() {
                                  isLoading = false;
                                  error = 'Sila muatnaik gambar';
                                });
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          !isLoading
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.white.withAlpha(200),
                  alignment: Alignment.center,
                  child: SpinKitChasingDots(
                    color: AppColor.primary,
                  ),
                ),
        ],
      ),
    );
  }
}

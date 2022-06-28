import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/mosque_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/person.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/models/village.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:my_khairat/styles/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile(
      {required this.userDAO, this.isRejected = false, Key? key})
      : super(key: key);

  final UserDAO userDAO;
  final bool isRejected;

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController _icController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  final FocusNode _icFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _occupationFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String selectedMosqueID = '';
  String selectedVillageID = '';

  XFile? paymentProve;
  XFile? addressProve;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _icController.text = (widget.userDAO.user as User).ic!;
    return Consumer<MosqueDAO>(builder: (context, mosqueDAO, child) {
      List<Mosque> mosques = mosqueDAO.mosques;

      List<Village> villages = mosqueDAO.villages;

      return Container(
        color: Colors.white,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white54,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Text(
                              'MyKhairat',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            !widget.isRejected
                                ? const SizedBox.shrink()
                                : Column(
                                    children: [
                                      Text(
                                        'Maklumat anda telah ditolak. Sila isi maklumat yang baharu',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                    ],
                                  ),
                            CustomTextFormField(
                              hintText: 'Kad Pengenalan',
                              focusNode: _icFocus,
                              controller: _icController,
                              isReadOnly: true,
                              validator: (value) => value!.isEmpty
                                  ? 'Sila isi No. k/Pengenalan'
                                  : null,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hintText: 'Nama',
                              focusNode: _nameFocus,
                              controller: _nameController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Sila isi Nama' : null,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hintText: 'Alamat',
                              focusNode: _addressFocus,
                              controller: _addressController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Sila isi Alamat' : null,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hintText: 'No Telefon',
                              focusNode: _phoneFocus,
                              controller: _phoneController,
                              validator: (value) => value!.isEmpty
                                  ? 'Sila isi No. Telefon'
                                  : null,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hintText: 'Pekerjaan',
                              focusNode: _occupationFocus,
                              controller: _occupationController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Sila isi Pekerjaan' : null,
                            ),
                            const SizedBox(height: 10),
                            const Text('Masjid'),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                hint: Text(selectedMosqueID.isEmpty
                                    ? '--Pilih Masjid--'
                                    : mosques
                                        .where((e) => e.id == selectedMosqueID)
                                        .first
                                        .name!),
                                items: mosques.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e.name!),
                                    value: e.id,
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedMosqueID = value!;
                                    mosqueDAO.getVillages(value);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Kampung'),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                  hint: Text(selectedVillageID.isEmpty
                                      ? '--Pilih Kampung--'
                                      : villages
                                          .where(
                                              (e) => e.id == selectedVillageID)
                                          .first
                                          .name!),
                                  items: villages.map((e) {
                                    return DropdownMenuItem(
                                      child: Text(e.name!),
                                      value: e.id,
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedVillageID = value!;
                                    });
                                  }),
                            ),
                            const SizedBox(height: 10),
                            selectedMosqueID.isEmpty
                                ? const SizedBox.shrink()
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: AppColor.primary),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.h),
                                    child: Column(
                                      children: [
                                        Text('Nama Bank: ' +
                                            mosques
                                                .where((e) =>
                                                    e.id == selectedMosqueID)
                                                .first
                                                .bankName!),
                                        SizedBox(height: 1.h),
                                        Text('Nama Pemilik Bank: ' +
                                            mosques
                                                .where((e) =>
                                                    e.id == selectedMosqueID)
                                                .first
                                                .bankOwnerName!),
                                        SizedBox(height: 1.h),
                                        Text('No Akaun Bank: ' +
                                            mosques
                                                .where((e) =>
                                                    e.id == selectedMosqueID)
                                                .first
                                                .bankAccountNo!),
                                        SizedBox(height: 1.h),
                                        Text('Yuran: RM' +
                                            mosques
                                                .where((e) =>
                                                    e.id == selectedMosqueID)
                                                .first
                                                .monthlyFee!
                                                .toStringAsFixed(2)),
                                      ],
                                    ),
                                  ),
                            const SizedBox(height: 10),
                            const Text('Bukti Pembayaran'),
                            const SizedBox(height: 5),
                            customTextButton(
                              label: paymentProve == null
                                  ? 'Muatnaik Gambar'
                                  : paymentProve!.name,
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
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                  Navigator.pop(context);

                                                  if (mounted && file != null) {
                                                    setState(() {
                                                      paymentProve = file;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                    Ionicons.camera_outline),
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
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  Navigator.pop(context);

                                                  if (mounted && file != null) {
                                                    setState(() {
                                                      paymentProve = file;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                    Ionicons.image_outline),
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
                              backgroundColor: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                            const SizedBox(height: 10),
                            const Text('Bukti Alamat'),
                            const SizedBox(height: 5),
                            customTextButton(
                              label: addressProve == null
                                  ? 'Muatnaik Gambar'
                                  : addressProve!.name,
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
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                  Navigator.pop(context);

                                                  if (mounted && file != null) {
                                                    setState(() {
                                                      addressProve = file;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                    Ionicons.camera_outline),
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
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  Navigator.pop(context);

                                                  if (mounted && file != null) {
                                                    setState(() {
                                                      addressProve = file;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                    Ionicons.image_outline),
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
                              backgroundColor: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                            const SizedBox(height: 15),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isSaving = true;
                                });

                                if (_formKey.currentState!.validate() &&
                                    paymentProve != null &&
                                    addressProve != null &&
                                    selectedMosqueID.isNotEmpty &&
                                    selectedVillageID.isNotEmpty) {
                                  User user = widget.userDAO.user;
                                  bool res = await widget.userDAO.complete(
                                    user.id!,
                                    paymentProve,
                                    addressProve,
                                    {
                                      'user_id': user.id.toString(),
                                      'person_id': user.personID.toString(),
                                      'mosque_id': selectedMosqueID,
                                      'village_id': selectedMosqueID,
                                      'person_name': _nameController.text,
                                      'person_ic': _icController.text,
                                      'person_phone': _phoneController.text,
                                      'person_address': _addressController.text,
                                      'person_occupation':
                                          _occupationController.text,
                                      'person_status': 'pending',
                                      'person_register_date':
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now()),
                                    },
                                  );

                                  if (res) {
                                    Navigator.pop(context);
                                  }
                                }

                                setState(() {
                                  isSaving = false;
                                });
                              },
                              child: const Text(
                                'Selesai',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () async {
                                await widget.userDAO.logout();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Log Keluar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  !isSaving
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
            ),
          ),
        ),
      );
    });
  }
}

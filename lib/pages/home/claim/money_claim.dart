import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/claim_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/claim.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class MoneyClaim extends StatefulWidget {
  const MoneyClaim({Key? key, required this.userDAO}) : super(key: key);

  final UserDAO userDAO;
  @override
  State<MoneyClaim> createState() => _MoneyClaimState();
}

class _MoneyClaimState extends State<MoneyClaim> {
  File? _imageFile;
  XFile? pickedFile;
  ImagePicker _picker = ImagePicker();

  final TextEditingController _hubunganController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _sebabController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final FocusNode _hubunganFocus = FocusNode();
  final FocusNode _namaFocus = FocusNode();
  final FocusNode _sebabFocus = FocusNode();

  DateTime? date;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _picker = new ImagePicker();
    _dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    User user = widget.userDAO.user;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ChangeNotifierProvider<ClaimDAO>(
        create: (context) => ClaimDAO(),
        child: Consumer<ClaimDAO>(
          builder: (context, claimDAO, child) {
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
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.all(1.h),
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Pemohon(Waris Simati)',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      '${user.name}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Alamat',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      '${user.address}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'No. K/Pengenalan',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      '${user.ic}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'No. Telefon',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      '${user.phone}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Nama Si mati',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    customTextFormField(
                                      hintText: 'Nama si mati',
                                      icon: Ionicons.person,
                                      controller: _namaController,
                                      focusNode: _namaFocus,
                                      validator: (value) => value!.isEmpty
                                          ? 'Sila isi nama si mati'
                                          : null,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Hubungan',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    customTextFormField(
                                      hintText: 'Hubungan',
                                      icon: Ionicons.people_sharp,
                                      controller: _hubunganController,
                                      focusNode: _hubunganFocus,
                                      validator: (value) => value!.isEmpty
                                          ? 'Sila isi hubungan'
                                          : null,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Tarikh Meninggal',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Date',
                                        icon: Icon(Icons.event),
                                      ),
                                      controller: _dateController,
                                      onTap: () async => pickDate(context),
                                      validator: (value) => value!.isEmpty
                                          ? 'Sila isi tarikh meninggal'
                                          : null,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Sebab-sebab Meninggal',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    customTextFormField(
                                      hintText: 'Sebab-sebab meninggal',
                                      icon: Ionicons.reader_sharp,
                                      controller: _sebabController,
                                      focusNode: _sebabFocus,
                                      validator: (value) => value!.isEmpty
                                          ? 'Sila isi sebab-sebab meninggal'
                                          : null,
                                    ),
                                    SizedBox(height: 2.h),
                                    const Text(
                                      "Surat Kematian",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Card(
                                      margin: EdgeInsetsDirectional.all(10),
                                      child: (_imageFile == null)
                                          ? Text("")
                                          : Image.file(_imageFile!),
                                    ),
                                    Center(
                                      child: ElevatedButton.icon(
                                        icon: Icon(Icons.camera_alt),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColor.primary),
                                        ),
                                        onPressed: () {
                                          _showChoiceDialog(context);
                                        },
                                        label: const Text("MUAT NAIK GAMBAR"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          dynamic res = await claimDAO.addClaim(
                                            user.id!,
                                            user.mosqueID!,
                                            Claim(
                                              claimername: user.name,
                                              claimeric: user.ic,
                                              claimeraddress: user.address,
                                              claimerrelation:
                                                  _hubunganController.text,
                                              deaddate: _dateController.text,
                                              deadname: _namaController.text,
                                              deadreason: _sebabController.text,
                                              status: 'pending',
                                            ),
                                            pickedFile!,
                                          );

                                          Navigator.pop(context, res);
                                        },
                                        child: const Text("Hantar"),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColor.primary),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.h)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    !isSaving
                        ? const SizedBox.shrink()
                        : Container(
                            alignment: Alignment.center,
                            color: Colors.white.withAlpha(200),
                            child: SpinKitChasingDots(
                              color: AppColor.primary,
                            ),
                          ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  //get date
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
    if (date != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date!);

      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  //get from camera
  Future _getFromGallery(BuildContext context) async {
    XFile? _pickedFile;
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (_pickedFile != null) {
      setState(() {
        _imageFile = File(_pickedFile!.path);
        pickedFile = _pickedFile;
      });
      Navigator.pop(context, MoneyClaim(userDAO: widget.userDAO));
    }
  }

  /// Get from Camera
  Future _getFromCamera(BuildContext context) async {
    XFile? _pickedFile;
    _pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (_pickedFile != null) {
      setState(() {
        _imageFile = File(_pickedFile!.path);
        pickedFile = _pickedFile;
      });
      Navigator.pop(context, MoneyClaim(userDAO: widget.userDAO));
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Pilih",
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(height: 1.h, color: Colors.black),
                  ListTile(
                    onTap: () {
                      _getFromGallery(context);
                    },
                    title: const Text('Gallery'),
                    leading: Icon(
                      Icons.account_box,
                      color: AppColor.primary,
                    ),
                  ),
                  Divider(
                    height: 1.h,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      _getFromCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

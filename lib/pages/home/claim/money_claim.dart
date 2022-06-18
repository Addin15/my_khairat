import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class MoneyClaim extends StatefulWidget {
  const MoneyClaim({Key? key}) : super(key: key);

  @override
  State<MoneyClaim> createState() => _MoneyClaimState();
}

class _MoneyClaimState extends State<MoneyClaim> {
  TextEditingController name = TextEditingController();
  TextEditingController icno = TextEditingController();
  TextEditingController kariah = TextEditingController();
  File? imageFile;
  XFile? pickedFile;
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _picker = new ImagePicker();
  }

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
        body: SingleChildScrollView(
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
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: 'Nama Arwah',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(color: Colors.grey),
                          onChanged: (value) {
                            setState(() {
                              name.text = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: 'No IC',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(color: Colors.grey),
                          onChanged: (value) {
                            setState(() {
                              icno.text = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: 'Kariah',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(color: Colors.grey),
                          onChanged: (value) {
                            setState(() {
                              kariah.text = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Surat Kematian",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          margin: EdgeInsetsDirectional.all(10),
                          child: (imageFile == null)
                              ? Text("")
                              : Image.file(imageFile!),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.camera_alt),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColor.primary),
                          ),
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                          label: Text("MUAT NAIK GAMBAR"),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Hantar"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColor.primary),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.h)),
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
        ));
  }

  //get from camera
  Future _getFromGallery(BuildContext context) async {
    pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile!.path);
      });
      Navigator.pop(context, MoneyClaim());
    }
  }

  /// Get from Camera
  Future _getFromCamera(BuildContext context) async {
    pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile!.path);
      });
      Navigator.pop(context, MoneyClaim());
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose Option",
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

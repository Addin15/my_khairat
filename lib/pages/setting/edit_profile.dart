import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sunting profil',
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
        body: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     AppColor.secondary,
            //     AppColor.primary,
            //   ],
            // ),
            color: Colors.white54,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              CustomTextFormField(
                hintText: 'Kad Pengenalan',
                focusNode: _icFocus,
                controller: _icController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'Nama',
                focusNode: _nameFocus,
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'Alamat',
                focusNode: _addressFocus,
                controller: _addressController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'No Telefon',
                focusNode: _phoneFocus,
                controller: _phoneController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'Pekerjaan',
                focusNode: _occupationFocus,
                controller: _occupationController,
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
                onPressed: () {},
                child: const Text(
                  'Selesai',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

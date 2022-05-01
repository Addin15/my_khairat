import 'package:flutter/material.dart';
import 'package:my_khairat/pages/nav.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


//refer google drive mykhairat for registration form
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _icController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final FocusNode _icFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _occupationFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pendaftaran MyKhairat',
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
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Kata Laluan',
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  isObscured: true,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Pengesahan Kata Laluan',
                  focusNode: _confirmPasswordFocus,
                  controller: _confirmPasswordController,
                  isObscured: true,
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
                  child: Text(
                    'Daftar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}


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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _emailFocus = FocusNode();
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
                hintText: 'E-mel',
                focusNode: _emailFocus,
                controller: _emailController,
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
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Nav()));
                },
                child: Text(
                  'Daftar',
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

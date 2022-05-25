import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/pages/nav.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _icController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _icFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
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
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Ionicons.close,
                            color: AppColor.primary,
                            size: 28.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: _formKey,
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
                                hintText: 'No Kad Pengenalan',
                                focusNode: _icFocus,
                                controller: _icController,
                                validator: (value) => value!.length <= 5
                                    ? 'Sila isi no kad pengenalan yang sah'
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                hintText: 'Emel',
                                focusNode: _emailFocus,
                                controller: _emailController,
                                validator: (value) =>
                                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!)
                                        ? null
                                        : 'Emel tidak sah!',
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                hintText: 'Kata Laluan',
                                focusNode: _passwordFocus,
                                controller: _passwordController,
                                isObscured: true,
                                validator: (value) => value!.length <= 5
                                    ? 'Kata laluan hendaklah sekurangnya 6 angka'
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormField(
                                hintText: 'Pengesahan Kata Laluan',
                                focusNode: _confirmPasswordFocus,
                                controller: _confirmPasswordController,
                                isObscured: true,
                                validator: (value) =>
                                    value! != _passwordController.text
                                        ? 'Kata laluan tidak sama'
                                        : null,
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
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    isLoading = true;
                                  });

                                  if (_formKey.currentState!.validate()) {
                                    await widget.userDAO.register(
                                        _emailController.text,
                                        _icController.text,
                                        _passwordController.text);
                                  }

                                  setState(() {
                                    isLoading = false;
                                  });

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Daftar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Telah ada akaun?',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                  SizedBox(width: 1.w),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Text(
                                      'Log Masuk',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            !isLoading
                ? const SizedBox.shrink()
                : Container(
                    color: Colors.white.withOpacity(0.4),
                    alignment: Alignment.center,
                    child: SpinKitChasingDots(color: AppColor.primary),
                  ),
          ],
        ),
      ),
    );
  }
}

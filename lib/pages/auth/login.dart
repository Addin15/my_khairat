import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/pages/auth/register.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

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
                          onPressed: () => Navigator.pop(context),
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
                                'MyKhairat',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                              SizedBox(height: 1.h),
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
                                    isLoading = true;
                                  });

                                  if (_formKey.currentState!.validate()) {
                                    await widget.userDAO.login(
                                        _emailController.text,
                                        _passwordController.text);
                                  }

                                  setState(() {
                                    isLoading = false;
                                  });

                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Log Masuk',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tiada akaun?',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                  SizedBox(width: 1.w),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Register(
                                                userDAO: widget.userDAO))),
                                    child: Text(
                                      'Daftar',
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
                  )
          ],
        ),
      ),
    );
  }
}

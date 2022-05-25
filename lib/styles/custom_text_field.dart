import 'package:flutter/material.dart';
import 'package:my_khairat/styles/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.hintText,
      this.controller,
      this.focusNode,
      this.isObscured = false,
      this.validator,
      Key? key})
      : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isObscured;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscured,
      validator: validator,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: AppColor.primary,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.primary),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}

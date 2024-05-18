import 'package:flutter/material.dart';
import '../../core/style/color_app.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? colorHint;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.prefixIcon,
    this.suffixIcon,
    this.colorHint,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validate,
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: InputDecoration(
            
            contentPadding: EdgeInsets.all(10),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: colorHint),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.grey100),
                borderRadius: BorderRadius.circular(4)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.grey100),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ],
    );
  }
}

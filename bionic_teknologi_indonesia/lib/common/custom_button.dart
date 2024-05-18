import 'package:flutter/material.dart';

import '../core/style/color_app.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final bool? isLoading;
  final Color? color;
  final double? height;
  final double? widht;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight ;
  final Color? colorText;
  
  

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.color,
      this.height,
      this.widht,
      this.borderRadius,
      this.colorText,
      this.fontSize,
      this.fontWeight,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius != null
                    ? BorderRadius.circular(borderRadius!)
                    : BorderRadius.circular(8)),
            minimumSize: height != null || widht != null
                ? Size(widht ?? 0, height ?? 0)
                : Size(double.infinity, 50)),
        onPressed: onPressed,
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorApp.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: colorText),
              ));
  }
}

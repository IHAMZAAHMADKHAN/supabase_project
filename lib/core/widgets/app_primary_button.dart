import 'package:flutter/material.dart';
import 'package:supabase_project/core/constants/colors.dart';
import 'package:supabase_project/resource/text.dart';

class AppPrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? borderRadius;

  const AppPrimaryButton({
    super.key,
    this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 50,
    this.width = 50,
    this.borderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        child: Text(
          title!,
          style: style16_600.copyWith(color: textColor ?? blackColor),
        ),
      ),
    );
  }
}

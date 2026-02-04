import 'package:flutter/material.dart';
import 'package:supabase_project/core/constants/colors.dart';
import 'package:supabase_project/resource/text.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final bool showBackArrow;

  const CustomProfileAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.showBackArrow = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Row(
          children: [
            // 1. The Circular Back Button
            if (showBackArrow)
              GestureDetector(
                onTap: onBackTap ?? () => Navigator.pop(context),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    // Subtle shadow to match the image
                    boxShadow: [
                      BoxShadow(
                        color: whiteColor,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new, // The chevron style icon
                    size: 18,
                    color: blackColor,
                  ),
                ),
              ),

            // 2. Spacing between button and text
            if (showBackArrow) const SizedBox(width: 20),

            // 3. The Title
            Text(title,
                style: style22_400.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_project/core/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;
  final ImageProvider? imageProvider;

  const CustomAppBar({
    super.key,
    this.onMenuTap,
    this.onProfileTap,
    this.imageProvider,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMenuButton(),
            _buildProfileAvatar(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return InkWell(
      onTap: onMenuTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [],
        ),
        // Using Icons.short_text_rounded usually matches the "stylish" menu look better
        // than standard Icons.menu
        child: const Icon(Icons.sort_rounded, color: blackColor, size: 28),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return GestureDetector(
      onTap: onProfileTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // border:
          //   Border.all(color: whiteColor, width: 2), // Optional white border
          boxShadow: [],
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: blackColor, // Background for the Memoji/Avatar
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ),
      ),
    );
  }
}

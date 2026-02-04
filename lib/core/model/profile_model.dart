import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final String route; // In a real app, you'd use this for navigation

  ProfileMenuItem({
    required this.title,
    this.route = '',
  });
}

class UserProfile {
  final String name;
  final String email;
  final ImageProvider? image; // Or asset path

  UserProfile({
    required this.name,
    required this.email,
    this.image,
  });
}

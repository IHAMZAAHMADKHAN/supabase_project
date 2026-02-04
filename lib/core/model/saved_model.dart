import 'package:flutter/material.dart';

class RecentPlaceModel {
  final String name;
  RecentPlaceModel({required this.name});
}

class SavedCategoryModel {
  final String title;
  final String subtitle;
  final ImageProvider? image;

  SavedCategoryModel({
    required this.title,
    required this.subtitle,
    this.image,
  });
}

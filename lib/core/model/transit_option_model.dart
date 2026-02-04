import 'package:flutter/material.dart';

class TransitOptionModel {
  final String id;
  final String label;
  final Image icon; // In a real app, this might be a String assetPath
  final Color? iconColor;

  TransitOptionModel({
    required this.id,
    required this.label,
    required this.icon,
    this.iconColor,
  });
}

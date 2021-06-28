import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  bool? isButton;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.isButton,
  });
}

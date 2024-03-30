import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  final String snackContent;
  AppSnackBar({super.key, required this.snackContent})
      : super(
            content: Text(snackContent), duration: const Duration(seconds: 5));
}

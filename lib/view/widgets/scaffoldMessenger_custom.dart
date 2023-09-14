import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  final String text;
  const SnackBarCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      elevation: 150.0,
    );
  }
}

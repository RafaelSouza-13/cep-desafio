import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool enable;
  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xF1F1F1F1),
            enabled: enable,
            label: Text(
              label,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black54),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}

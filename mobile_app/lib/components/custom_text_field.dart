import 'package:flutter/material.dart';
import 'package:mobile_app/core/constats/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 300,
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: ColorConstants.lightBlueCOlor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

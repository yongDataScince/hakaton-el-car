import 'package:flutter/material.dart';
import 'package:mobile_app/core/constats/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.width = 300,
    this.validator,
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final double width;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: width,
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: ColorConstants.lightBlueColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

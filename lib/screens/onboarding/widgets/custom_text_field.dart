import 'package:dating_app/config/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        hintText: hint,
        contentPadding: const EdgeInsets.only(bottom: 5, top: 12.5),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: white),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

import 'package:dating_app/config/app_text.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomCheckbox({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (bool? newValue) {}),
        AppText(size: 15, text: text)
      ],
    );
  }
}

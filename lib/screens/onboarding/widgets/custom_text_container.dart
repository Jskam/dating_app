import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomTextContainer({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: gradientColors,
          ),
        ),
        child: Center(child: AppText(size: 14, text: text, color: white)),
      ),
    );
  }
}

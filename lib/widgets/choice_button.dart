import 'package:dating_app/config/colors.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double size;
  final IconData icon;
  final bool hasGradient;
  const ChoiceButton({
    Key? key,
    this.hasGradient = false,
    required this.color,
    this.height = 60,
    required this.icon,
    this.size = 25,
    this.width = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? const LinearGradient(
                colors: gradientColors,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            offset: const Offset(3, 3),
            blurRadius: 4,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }
}

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
    required this.height,
    required this.icon,
    required this.size,
    required this.width,
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
                colors: [Colors.pinkAccent, Colors.blue],
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
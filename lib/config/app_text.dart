import 'package:dating_app/config/colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget AppText({
  FontWeight weight = FontWeight.normal,
  Color color = black,
  required double size,
  required String text,
  int maxLines = 0,
  bool overflow = false,
  bool lineThrough = false,
  bool alignCenter = false,
  double interline = 1.25,
}) {
  return Text(
    text,
    textAlign: alignCenter == true ? TextAlign.center : null,
    maxLines: maxLines == 0 ? null : maxLines,
    overflow: overflow == true ? TextOverflow.ellipsis : null,
    style: TextStyle(
        height:interline,
        fontFamily: 'Merriweather',
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        ),
  );
}

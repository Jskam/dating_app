import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(child: Image.asset('assets/images/logo.png', height: 50)),
          Expanded(
              flex: 2,
              child: AppText(
                size: 28,
                text: 'DISCOVER',
                isBold: FontWeight.bold,
              )),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message, color: black, size: 28),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person, color: black, size: 28),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

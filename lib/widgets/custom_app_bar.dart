import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;
  const CustomAppBar({
    Key? key,
    this.title = 'DISCOVER',
    this.hasActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: black),
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: AppText(
              text: title,
              size: 26,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: hasActions
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, MainNavigationRouteNames.matchesScreen);
                },
                icon: const Icon(Icons.message, color: black, size: 28),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, MainNavigationRouteNames.profileScreen);
                },
                icon: const Icon(Icons.person, color: black, size: 28),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

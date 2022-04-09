import 'package:flutter/material.dart';

import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          UserCard(user: User.users[0]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ChoiceButton(
                color: Colors.red,
                height: 60,
                icon: Icons.clear_rounded,
                size: 25,
                width: 60,
              ),
              ChoiceButton(
                color: Colors.white,
                height: 80,
                hasGradient: true,
                icon: Icons.favorite,
                size: 30,
                width: 80,
              ),
              ChoiceButton(
                color: Colors.black54,
                height: 60,
                icon: Icons.watch_later,
                size: 25,
                width: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

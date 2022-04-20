import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                // child: SvgPicture.asset('assets/svg/start.svg'),
                child: Image.asset('assets/images/start.png'),
              ),
              const SizedBox(height: 50),
              AppText(
                  size: 26, text: 'Welcome to Lorem', weight: FontWeight.bold),
              const SizedBox(height: 20),
              AppText(
                  size: 17,
                  interline: 1.7,
                  alignCenter: true,
                  text:
                      'Lorem ipsum dolor sit amet, consetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.'),
            ],
          ),
          CustomButton(tabController: tabController, text: 'START'),
        ],
      ),
    );
  }
}

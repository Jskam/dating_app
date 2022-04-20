import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;

  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: gradientColors,
        ),
      ),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(elevation: 0, primary: Colors.transparent),
        onPressed: () async {
          if (tabController.index == 5) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainNavigationRouteNames.homeSreen, (route) => false);
          } else {
            tabController.animateTo(tabController.index + 1);
          }

          if (tabController.index == 2) {
            context.read<SignupCubit>().signupWithCredentials();
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: AppText(
            size: 17,
            text: text,
            color: white,
            weight: FontWeight.bold,
            alignCenter: true,
          ),
        ),
      ),
    );
  }
}

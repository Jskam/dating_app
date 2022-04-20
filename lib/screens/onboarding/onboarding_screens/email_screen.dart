import 'dart:developer';

import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  size: 32,
                  text: 'What\'s Your Email Address?',
                  weight: FontWeight.w300,
                ),
                CustomTextField(
                  hint: 'ENTER YOUR EMAIL',
                  onChanged: (value) {
                    context.read<SignupCubit>().emailChanged(value);
                    log(state.email);
                  },
                ),
                const SizedBox(height: 100),
                AppText(
                  size: 32,
                  text: 'Choose a Password',
                  weight: FontWeight.w300,
                ),
                CustomTextField(
                  hint: 'ENTER YOUR PASSWORD',
                  onChanged: (value) {
                    context.read<SignupCubit>().passwordChanged(value);
                  },
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 1,
                  selectedColor: blue,
                  unselectedColor: Colors.grey.withOpacity(.3),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  tabController: tabController,
                  text: 'NEXT STEP',
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

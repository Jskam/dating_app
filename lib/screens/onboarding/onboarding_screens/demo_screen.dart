import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
                text: 'What\'s Your Gender?',
                weight: FontWeight.w300,
              ),
              const SizedBox(height: 10),
              CustomCheckbox(tabController: tabController, text: 'MALE'),
              CustomCheckbox(tabController: tabController, text: 'FEMALE'),
              const SizedBox(height: 100),
              AppText(
                size: 32,
                text: 'What\'s Your Age?',
                weight: FontWeight.w300,
              ),
              CustomTextField(
  
                hint: 'ENTER YOUR AGE',
                controller: controller,
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
                selectedColor: blue,
                unselectedColor: Colors.grey.withOpacity(.3),
              ),
              const SizedBox(height: 20),
              CustomButton(tabController: tabController, text: 'NEXT STEP'),
            ],
          ),
        ],
      ),
    );
  }
}

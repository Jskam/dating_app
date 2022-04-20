import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_container.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  final TabController tabController;

  const Bio({Key? key, required this.tabController}) : super(key: key);

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
                text: 'Describe Yourself in a Few Words?',
                weight: FontWeight.w300,
              ),
              CustomTextField(
      
                hint: 'ENTER YOUR BIO',
                controller: controller,
              ),
              const SizedBox(height: 100),
              AppText(
                size: 32,
                text: 'What Do You Like?',
                weight: FontWeight.w300,
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ECONOMIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'POLITIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ART'),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'READING'),
                  CustomTextContainer(
                      tabController: tabController, text: 'YOGA'),
                  CustomTextContainer(
                      tabController: tabController, text: 'DANCE'),
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 5,
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

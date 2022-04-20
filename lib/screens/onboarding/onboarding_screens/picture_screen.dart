import 'package:dating_app/blocs/images/images_bloc.dart';
import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Picture extends StatelessWidget {
  final TabController tabController;

  const Picture({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                text: 'Add Two or More Pictures',
                weight: FontWeight.w300,
              ),
              const SizedBox(height: 10),
              BlocBuilder<ImagesBloc, ImagesState>(
                builder: (context, state) {
                  var i = 0;
                  if (state is ImagesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ImagesLoaded) {
                    var imagesCount = state.imageUrls.length;
                    return Column(
                      children: [
                        Row(
                          children: [
                            imagesCount > 0
                                ? CustomImageContainer(
                                    imageUrl: state.imageUrls[0],
                                  )
                                : const CustomImageContainer(),
                          ],
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const CustomImageContainer(),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 4,
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

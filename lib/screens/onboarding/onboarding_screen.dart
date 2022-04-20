import 'package:flutter/material.dart';

import 'package:dating_app/config/colors.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/screens.dart';
import 'package:dating_app/widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demographic'),
    Tab(text: 'Pictures'),
    Tab(text: 'Bio'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(
            () {
              if (!tabController.indexIsChanging) {}
            },
          );
          return Scaffold(
            backgroundColor: white,
            appBar: const CustomAppBar(
              title: 'LOREM',
              hasActions: false,
            ),
            body: TabBarView(
              children: [
                Start(tabController: tabController),
                Email(tabController: tabController),
                EmailVerification(tabController: tabController),
                Demo(tabController: tabController),
                Picture(tabController: tabController),
                Bio(tabController: tabController),
              ],
            ),
          );
        },
      ),
    );
  }
}

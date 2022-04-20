import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls![0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeLeft(user: User.users[0]));
                          },
                          child: const ChoiceButton(
                            color: pink,
                            icon: Icons.clear_rounded,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeRight(user: User.users[0]));
                          },
                          child: const ChoiceButton(
                            color: white,
                            height: 80,
                            hasGradient: true,
                            icon: Icons.favorite,
                            size: 30,
                            width: 80,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ChoiceButton(
                            color: Colors.black54,
                            icon: Icons.watch_later,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    size: 32,
                    text: '${user.name}, ${user.age}',
                    weight: FontWeight.bold,
                  ),
                  AppText(
                      size: 22,
                      text: user.jobTitle??'',
                      color: black.withAlpha(200)),
                  const SizedBox(height: 15),
                  AppText(
                    size: 24,
                    text: 'About',
                    weight: FontWeight.bold,
                  ),
                  AppText(
                    size: 20,
                    weight: FontWeight.w300,
                    text: user.bio!,
                  ),
                  const SizedBox(height: 15),
                  AppText(
                    size: 24,
                    text: 'Interests',
                    weight: FontWeight.bold,
                  ),
                  Row(
                    children: user.interests!
                        .map(
                          (interest) => Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(top: 8, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                            child: AppText(
                                size: 17, text: interest, color: Colors.white),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

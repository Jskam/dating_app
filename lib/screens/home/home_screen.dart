import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/navigation.dart';
import 'package:flutter/material.dart';

import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, MainNavigationRouteNames.userScreen,
                      arguments: state.users[0]),
                  child: Draggable(
                    child: UserCard(user: state.users[0]),
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeLeft(user: state.users[0]));
                      } else {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeRight(user: state.users[0]));
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeLeft(user: state.users[0]));
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
                            .add(SwipeRight(user: state.users[0]));
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
              ],
            );
          } else {
            return Center(child: AppText(size: 32, text: 'Error'));
          }
        },
      ),
    );
  }
}

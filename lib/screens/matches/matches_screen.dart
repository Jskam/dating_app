import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/navigation.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();
    return Scaffold(
      appBar: const CustomAppBar(title: 'MATCHES'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(size: 20, text: 'Your Likes', weight: FontWeight.bold),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: inactiveMatches.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                         Navigator.pushNamed(
                          context, MainNavigationRouteNames.chatScreen,
                          arguments: inactiveMatches[index]);
                      },
                      child: Column(
                        children: [
                          UserImageSmall(
                            height: 70,
                            width: 70,
                            imageUrl:
                                inactiveMatches[index].matchedUser.imageUrls![0],
                          ),
                          AppText(
                              weight: FontWeight.bold,
                              size: 16,
                              maxLines: 1,
                              overflow: true,
                              text: inactiveMatches[index].matchedUser.name!)
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              AppText(size: 20, text: 'Your Chats', weight: FontWeight.bold),
              ListView.builder(
                itemCount: activeMatches.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, MainNavigationRouteNames.chatScreen,
                          arguments: activeMatches[index]);
                    },
                    child: Row(
                      children: [
                        UserImageSmall(
                          height: 70,
                          width: 70,
                          imageUrl:
                              activeMatches[index].matchedUser.imageUrls![0],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 20,
                              weight: FontWeight.bold,
                              text: activeMatches[index].matchedUser.name!,
                            ),
                            const SizedBox(height: 3),
                            AppText(
                              size: 17,
                              overflow: true,
                              text: activeMatches[index]
                                  .chat![0]
                                  .messages[0]
                                  .message,
                            ),
                            const SizedBox(height: 1),
                            AppText(
                              size: 15,
                              text: activeMatches[index]
                                  .chat![0]
                                  .messages[0]
                                  .timeString,
                              color: Colors.black.withOpacity(.8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

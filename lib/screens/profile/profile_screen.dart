import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
      appBar: const CustomAppBar(title: 'PROFILE'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(user.imageUrls![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        black.withOpacity(.9),
                        black.withOpacity(.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: AppText(
                        weight: FontWeight.bold,
                        size: 32,
                        text: user.name!,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const _TitleWithIcon(title: 'Bio', icon: Icons.edit),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppText(size: 16, text: user.bio!),
                ),
                const _TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: user.imageUrls!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          margin: index == 0
                              ? const EdgeInsets.only(left: 20)
                              : null,
                          height: 125,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black26),
                            image: DecorationImage(
                              image: NetworkImage(user.imageUrls![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const _TitleWithIcon(title: 'Location', icon: Icons.edit),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppText(size: 16, text: 'Russia, Vladivostok City'),
                ),
                const _TitleWithIcon(title: 'Interests', icon: Icons.edit),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
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
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const _TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            weight: FontWeight.bold,
            size: 20,
            text: title,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
        ],
      ),
    );
  }
}

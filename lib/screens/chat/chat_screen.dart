import 'package:dating_app/config/app_text.dart';
import 'package:dating_app/config/colors.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final UserMatch userMatch;
  const ChatScreen({Key? key, required this.userMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f3f2),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: black),
        title: Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                userMatch.matchedUser.imageUrls![0],
              ),
            ),
            AppText(
              size: 16,
              weight: FontWeight.bold,
              text: userMatch.matchedUser.name!,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: userMatch.chat != null
                  ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: userMatch.chat![0].messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: userMatch
                                    .chat![0].messages[index].senderId ==
                                1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue[100],
                                  ),
                                  child: AppText(
                                    size: 16,
                                    text: userMatch
                                        .chat![0].messages[index].message,
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        userMatch.matchedUser.imageUrls![0],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: Colors.black,
                                      ),
                                      child: AppText(
                                        size: 16,
                                        text: userMatch.chat![0]
                                            .messages[index].message,
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    },
                  )
                  : Center(child: AppText(size: 22, text: 'Be first..')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 100,
            child: Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Type here...',
                      contentPadding: EdgeInsets.only(
                          left: 20, bottom: 5, top: 5, right: 20),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.send,
                      color: white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

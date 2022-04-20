import 'models.dart';
import 'package:equatable/equatable.dart';

class UserMatch extends Equatable {
  final int id;
  final int userId;
  final User matchedUser;
  final List<Chat>? chat;

  const UserMatch({
    required this.id,
    required this.userId,
    required this.matchedUser,
    this.chat,
  });

  @override
  List<Object?> get props => [id, userId, matchedUser];

  static List<UserMatch> matches = [
    UserMatch(
      id: 1,
      userId: 1,
      matchedUser: User.users[2],
      chat: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 2)
          .toList(),
    ),
    UserMatch(
      id: 1,
      userId: 1,
      matchedUser: User.users[3],
      chat: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 3)
          .toList(),
    ),
  ];
}

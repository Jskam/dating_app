import 'package:dating_app/models/message_model.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final int id;
  final int userId;
  final int matchedUserId;
  final List<Message> messages;

  const Chat({
    required this.id,
    required this.userId,
    required this.matchedUserId,
    required this.messages,
  });

  @override
  List<Object?> get props => [id, userId, matchedUserId, messages];

  static List<Chat> chats = [
    Chat(
      id: 1,
      userId: 1,
      matchedUserId: 2,
      messages: Message.messages
          .where((message) =>
              (message.senderId == 1 && message.receiverId == 2) ||
              (message.senderId == 2 && message.receiverId == 1))
          .toList(),
    ),
    
  ];
}

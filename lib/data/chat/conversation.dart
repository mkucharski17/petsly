import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/user/user_data.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class ConversationPreviewData with _$ConversationPreviewData {
  const factory ConversationPreviewData({
    required UserData otherUserData,
    required QueryDocumentSnapshot<Conversation> conversation,
  }) = _ConversationPreviewData;
}

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String firstUserId,
    required String secondUserId,
    required List<Message> messages,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String senderId,
    required DateTime dateTime,
    required String content,
    @Default(false) bool isRead,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

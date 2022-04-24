// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      firstUser: ConversationParticipant.fromJson(
          json['firstUser'] as Map<String, dynamic>),
      secondUser: ConversationParticipant.fromJson(
          json['secondUser'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'firstUser': instance.firstUser.toJson(),
      'secondUser': instance.secondUser.toJson(),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      senderId: json['senderId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      content: json['content'] as String,
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'dateTime': instance.dateTime.toIso8601String(),
      'content': instance.content,
      'isRead': instance.isRead,
    };

_$_ConversationParticipant _$$_ConversationParticipantFromJson(
        Map<String, dynamic> json) =>
    _$_ConversationParticipant(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_ConversationParticipantToJson(
        _$_ConversationParticipant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };

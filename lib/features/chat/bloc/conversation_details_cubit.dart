import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/user/user_data.dart';

part 'conversation_details_cubit.freezed.dart';

class ConversationDetailsCubit extends Cubit<ConversationDetailsState> {
  ConversationDetailsCubit({
    required this.firestore,
    required this.currentUserId,
    required this.otherUser,
  }) : super(const ConversationDetailsState()) {
    messagesSubscription = firestore
        .getCollection('conversations')
        .withConverter<Conversation>(
            fromFirestore: (snapshot, _) =>
                Conversation.fromJson(snapshot.data()!),
            toFirestore: (conversation, _) => conversation.toJson())
        .snapshots()
        .listen(_onMessage);
  }

  final String currentUserId;
  final UserData otherUser;
  final Firestore firestore;
  late final StreamSubscription messagesSubscription;

  void sendMessage(String messageContent) {
    final conversation = state.conversation;
    final message = Message(
      senderId: currentUserId,
      dateTime: DateTime.now().toUtc(),
      content: messageContent,
    );

    if (conversation != null) {
      final docId = conversation.reference.id;
      final messages = conversation.data().messages;

      firestore.updateDocument(
        collectionPath: 'conversations',
        docId: docId,
        data: conversation.data().copyWith(
          messages: [...messages, message],
        ).toJson(),
      );
    } else {
      firestore.addDocument(
        collectionPath: 'conversations',
        data: Conversation(
          firstUserId: currentUserId,
          secondUserId: otherUser.id,
          messages: [message],
        ).toJson(),
      );
    }
  }

  void markAsSeen(Message message) {
    final conversation = state.conversation;
    if (conversation == null) {
      return;
    }

    final messages = state.conversation?.data().messages;

    final indexToChange = messages?.indexOf(message);
    if (indexToChange != null && messages != null) {
      messages[indexToChange] = messages[indexToChange].copyWith(isRead: true);

      final docId = conversation.reference.id;

      firestore.updateDocument(
        collectionPath: 'conversations',
        docId: docId,
        data: conversation.data().copyWith(
          messages: [...messages],
        ).toJson(),
      );
    }
  }

  void _onMessage(QuerySnapshot<Conversation> snapshot) {
    final conversation = snapshot.docs.firstWhereOrNull((element) {
      final firstUserId = element.data().firstUserId;
      final secondUserId = element.data().secondUserId;

      return firstUserId == currentUserId && secondUserId == otherUser ||
          firstUserId == otherUser && secondUserId == currentUserId;
    });

    emit(state.copyWith(
      conversation: conversation,
      loading: false,
    ));
  }

  @override
  Future<void> close() {
    messagesSubscription.cancel();
    return super.close();
  }
}

@freezed
class ConversationDetailsState with _$ConversationDetailsState {
  const factory ConversationDetailsState({
    @Default(true) bool loading,
    QueryDocumentSnapshot<Conversation>? conversation,
  }) = _ConversationDetailsState;
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/user/user_data.dart';

part 'conversation_list_cubit.freezed.dart';

class ConversationListCubit extends Cubit<ConversationListState> {
  ConversationListCubit({required this.firestore})
      : super(const ConversationListState()) {
    conversationSubscription = firestore
        .getCollection('conversations')
        .withConverter<Conversation>(
            fromFirestore: (snapshot, _) =>
                Conversation.fromJson(snapshot.data()!),
            toFirestore: (conversation, _) => conversation.toJson())
        .snapshots()
        .listen(_onMessage);
    // Future.delayed(const Duration(seconds: 2), () {
    //   emit(state.copyWith(loading: false));
    // });
  }

  late final StreamSubscription conversationSubscription;

  final Firestore firestore;

  Future<void> _onMessage(QuerySnapshot<Conversation> snapshot) async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    final conversations = snapshot.docs.where((element) {
      final firstUserId = element.data().firstUserId;
      final secondUserId = element.data().secondUserId;

      return firstUserId == currentUserId || secondUserId == currentUserId;
    }).toList();

    conversations
      ..sort(
        (a, b) {
          return b
              .data()
              .messages
              .last
              .dateTime
              .compareTo(a.data().messages.last.dateTime);
        },
      );

    final otherUserIds = conversations.map(
      (e) => e.data().secondUserId == currentUserId
          ? e.data().firstUserId
          : e.data().secondUserId,
    );

    final otherUsers = await firestore
        .getCollection('users')
        .withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (userData, _) => userData.toJson(),
        )
        .get()
      ..docs.where((element) => otherUserIds.contains(element.data().id));

    emit(state.copyWith(
      conversations: conversations
          .map(
            (conv) => ConversationPreviewData(
              otherUserData: otherUsers.docs
                  .firstWhere((usr) =>
                      usr.data().id == conv.data().firstUserId ||
                      usr.data().id == conv.data().secondUserId)
                  .data(),
              conversation: conv,
            ),
          )
          .toList(),
      loading: false,
    ));
  }
}

@freezed
class ConversationListState with _$ConversationListState {
  const factory ConversationListState({
    @Default(true) bool loading,
    @Default([]) List<ConversationPreviewData> conversations,
  }) = _ConversationListState;
}

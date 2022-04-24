import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/data/firestore.dart';

part 'conversation_list_cubit.freezed.dart';

class ConversationListCubit extends Cubit<ConversationListState> {
  ConversationListCubit({required Firestore firestore})
      : super(const ConversationListState()) {
    conversationSubscription = firestore
        .getCollection('conversations')
        .withConverter<Conversation>(
            fromFirestore: (snapshot, _) =>
                Conversation.fromJson(snapshot.data()!),
            toFirestore: (conversation, _) => conversation.toJson())
        .snapshots()
        .listen(_onMessage);
  }

  late final StreamSubscription conversationSubscription;

  void _onMessage(QuerySnapshot<Conversation> snapshot) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    final conversations = snapshot.docs.where((element) {
      final firstUser = element.data().firstUser;
      final secondUser = element.data().secondUser;

      return firstUser.id == currentUserId || secondUser.id == currentUserId;
    }).toList();

    emit(state.copyWith(
      conversationList: conversations
        ..sort(
          (a, b) {
            return b
                .data()
                .messages
                .last
                .dateTime
                .compareTo(a.data().messages.last.dateTime);
          },
        ),
      loading: false,
    ));
  }
}

@freezed
class ConversationListState with _$ConversationListState {
  const factory ConversationListState({
    @Default(true) bool loading,
    @Default([]) List<QueryDocumentSnapshot<Conversation>> conversationList,
  }) = _ConversationListState;
}

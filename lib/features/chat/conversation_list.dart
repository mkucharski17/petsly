import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/user/user_data.dart';
import 'package:petsly/features/chat/bloc/conversation_list_cubit.dart';
import 'package:petsly/features/chat/conversation_details_page.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ConversationListBuilder();
  }
}

class _ConversationListBuilder extends StatelessWidget {
  const _ConversationListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationListCubit, ConversationListState>(
      builder: (context, state) {
        if (state.loading) {
          return const CircularProgressIndicator();
        } else {
          return _ConversationListView(conversations: state.conversationList);
        }
      },
    );
  }
}

class _ConversationListView extends StatelessWidget {
  const _ConversationListView({
    Key? key,
    required this.conversations,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Conversation>> conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final conversation = conversations[index].data();
        final currentUserId = FirebaseAuth.instance.currentUser!.uid;
        final otherUser = conversation.firstUser.id != currentUserId
            ? conversation.firstUser
            : conversation.secondUser;

        final lastMessage = conversation.messages.last;
        final lastMessageSenderName =
            lastMessage.senderId == currentUserId ? 'Ty' : otherUser.name;

        return GestureDetector(
          onTap: () async {
            final userData = await context.read<Firestore>().getDocument(
                  collectionPath: 'users',
                  snapshotQuery: (snapshot) {
                    return snapshot.mappedData['id'] == currentUserId;
                  },
                );
            final user =
                UserData.fromJson(userData!.data() as Map<String, dynamic>);

            Navigator.of(context).push(
              ConversationDetailsScreenRoute(
                otherUser: otherUser,
                currentUser: ConversationParticipant(
                  id: user.id,
                  name: user.name,
                  photoUrl: user.photoUrl,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(
                !lastMessage.isRead && lastMessage.senderId != currentUserId
                    ? 0.3
                    : 0.1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: ColoredBox(
                    color: Colors.white,
                    child: otherUser.photoUrl != null
                        ? CachedNetworkImage(
                            width: 48,
                            height: 48,
                            imageUrl: otherUser.photoUrl!,
                          )
                        : const Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 48,
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        otherUser.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$lastMessageSenderName:  ${lastMessage.content}',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!lastMessage.isRead &&
                    lastMessage.senderId != currentUserId)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

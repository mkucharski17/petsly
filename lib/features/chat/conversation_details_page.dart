import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/features/chat/bloc/conversation_details_cubit.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ConversationDetailsPage extends Page<void> {
  const ConversationDetailsPage({
    LocalKey? key,
    required this.otherUser,
    required this.currentUser,
  }) : super(key: key);

  final ConversationParticipant otherUser;
  final ConversationParticipant currentUser;

  @override
  Route<void> createRoute(BuildContext context) =>
      ConversationDetailsScreenRoute(
        page: this,
        otherUser: otherUser,
        currentUser: currentUser,
      );
}

class ConversationDetailsScreenRoute extends MaterialPageRoute<void> {
  ConversationDetailsScreenRoute({
    required ConversationParticipant otherUser,
    required ConversationParticipant currentUser,
    ConversationDetailsPage? page,
  }) : super(
          settings: page,
          builder: (context) => BlocProvider(
            create: (context) {
              return ConversationDetailsCubit(
                firestore: context.read(),
                currentUser: currentUser,
                otherUser: otherUser,
              );
            },
            child: ConversationDetailsScreen(otherUser: otherUser),
          ),
        );
}

class ConversationDetailsScreen extends StatelessWidget {
  const ConversationDetailsScreen({
    Key? key,
    required this.otherUser,
  }) : super(key: key);

  final ConversationParticipant otherUser;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationDetailsCubit, ConversationDetailsState>(
      builder: (context, state) {
        final conversation = state.conversation?.data();

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(otherUser.name),
          ),
          body: SafeArea(
            child: state.loading
                ? const CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: conversation != null
                            ? MessageList(
                                messages:
                                    conversation.messages.reversed.toList(),
                              )
                            : Center(
                                child: Text(
                                  'To poczatek twojej rozmowy z ${otherUser.name}',
                                ),
                              ),
                      ),
                      const _SendMessageField(),
                      const SizedBox(height: 16),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _SendMessageField extends StatefulWidget {
  const _SendMessageField({Key? key}) : super(key: key);

  @override
  State<_SendMessageField> createState() => _SendMessageFieldState();
}

class _SendMessageFieldState extends State<_SendMessageField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: TextField(controller: _controller),
        ),
        IconButton(
          icon: const Icon(
            Icons.send,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            context
                .read<ConversationDetailsCubit>()
                .sendMessage(_controller.text);
            _controller.text = '';
          },
        ),
      ],
    );
  }
}

class MessageList extends StatelessWidget {
  const MessageList({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      shrinkWrap: true,
      itemCount: messages.length,
      reverse: true,
      itemBuilder: (context, index) {
        final message = messages.elementAt(index);
        final isCurrentUserMessage =
            message.senderId == FirebaseAuth.instance.currentUser!.uid;

        return Align(
          alignment: isCurrentUserMessage
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: _Message(
            message: message,
            isCurrentUserMessage: isCurrentUserMessage,
          ),
        );
      },
    );
  }
}

class _Message extends StatelessWidget {
  _Message({
    Key? key,
    required this.message,
    required this.isCurrentUserMessage,
  }) : super(key: key);

  final Message message;
  final bool isCurrentUserMessage;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(message.hashCode),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 1 &&
            !isCurrentUserMessage &&
            !message.isRead) {
          context.read<ConversationDetailsCubit>().markAsSeen(message);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          color: isCurrentUserMessage ? Colors.blue : Colors.white,
          border: isCurrentUserMessage ? null : Border.all(color: Colors.blue),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
            ),
          ],
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: isCurrentUserMessage ? Colors.white : Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${message.dateTime.hour}:${message.dateTime.minute}',
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                message.content,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

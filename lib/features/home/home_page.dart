import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/care/care_tab.dart';
import 'package:petsly/features/chat/bloc/conversation_list_cubit.dart';
import 'package:petsly/features/chat/conversation_list.dart';
import 'package:petsly/features/offers/bloc/favourites_cubit.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:petsly/features/offers/favourites_page.dart';
import 'package:petsly/features/offers/filters_dialog.dart';
import 'package:petsly/features/offers/offer_list.dart';
import 'package:petsly/features/profile/profile.dart';

class HomePage extends Page<void> {
  const HomePage({LocalKey? key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) => HomeScreenRoute(page: this);
}

class HomeScreenRoute extends MaterialPageRoute<void> {
  HomeScreenRoute({HomePage? page})
      : super(
          settings: page,
          builder: (context) => const HomeScreen(),
        );
}

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<FavouritesCubit>().init();
    }, []);
    final selectedIndex = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(_getTitle(selectedIndex.value)),
        actions: [
          if (selectedIndex.value == 0)
            IconButton(
              onPressed: () =>
                  Navigator.of(context).push(FavouritesScreenRoute()),
              icon: const Icon(Icons.favorite_outline),
            ),
          if (selectedIndex.value == 0)
            IconButton(
              onPressed: () => FiltersDialog.show(
                context,
                initialFilters: context.read<OffersCubit>().state.filters,
              ),
              icon: const Icon(Icons.tune),
            ),
          if (selectedIndex.value == 1)
            IconButton(
              onPressed: () => context.read<AuthStateCubit>().signOut(),
              icon: const Icon(Icons.exit_to_app),
            ),
        ],
      ),
      bottomNavigationBar: _BottomBar(selectedIndex: selectedIndex),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _BodyChild(
          index: selectedIndex.value,
        ),
      ),
    );
  }

  String _getTitle(int index) {
    if (index == 0) {
      return 'Znajdź pomoc';
    } else if (index == 1) {
      return 'Twoje dane';
    } else if (index == 2) {
      return 'Opieka';
    } else {
      return 'Twoje rozmowy';
    }
  }
}

class _BodyChild extends StatelessWidget {
  const _BodyChild({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const OfferListBuilder();
    } else if (index == 1) {
      return const UserProfile();
    } else if (index == 2) {
      return const CareTab();
    } else {
      return const ConversationList();
    }
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 56,
      currentIndex: selectedIndex.value,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      onTap: (index) {
        selectedIndex.value = index;
      },
      items: [
        const BottomNavigationBarItem(
          label: 'Szukaj',
          icon: const Icon(Icons.search),
        ),
        const BottomNavigationBarItem(
          label: 'Profil',
          icon: Icon(Icons.account_circle),
        ),
        const BottomNavigationBarItem(
          label: 'Opieka',
          icon: Icon(Icons.pets),
        ),
        BottomNavigationBarItem(
          label: 'Wiadomości',
          icon: BlocBuilder<ConversationListCubit, ConversationListState>(
            builder: (context, state) {
              final userId = FirebaseAuth.instance.currentUser!.uid;

              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.chat_bubble),
                  if (state.conversations.any((element) {
                    final lastMessage =
                        element.conversation.data().messages.last;
                    return !lastMessage.isRead &&
                        lastMessage.senderId != userId;
                  }))
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

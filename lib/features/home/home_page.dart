import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/offers/offers_map.dart';
import 'package:petsly/features/orders/orders.dart';
import 'package:petsly/features/profile/profile.dart';
import 'package:provider/provider.dart';

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
    final selectedIndex = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_getTitle(selectedIndex.value)),
        actions: [
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
      return const OffersMapBuilder();
    } else if (index == 1) {
      return const UserProfile();
    } else if (index == 2) {
      return const Orders();
    } else {
      return const Text('Twoje rozmowy');
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
        const BottomNavigationBarItem(
          label: 'Wiadomości',
          icon: Icon(Icons.chat_bubble),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 50,
      color: Colors.red,
    );
  }
}

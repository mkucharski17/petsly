import 'package:build_context/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/auth/login_page.dart';
import 'package:petsly/features/home/home_page.dart';

class InitLoader extends StatelessWidget {
  const InitLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStateCubit, AuthState>(
      listener: (context, state) async {
        state.when(
          loggedIn: (_) => context.push(HomeScreenRoute()),
          notLoggedIn: () => context.push(LoginScreenRoute()),
        );
      },
      child: const Material(child: Center(child: CircularProgressIndicator())),
    );
  }
}

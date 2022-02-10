import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/auth/bloc/login_form_cubit.dart';
import 'package:petsly/ui/ui.dart';

class LoginPage extends Page<void> {
  const LoginPage({LocalKey? key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) => LoginScreenRoute(page: this);
}

class LoginScreenRoute extends MaterialPageRoute<void> {
  LoginScreenRoute({LoginPage? page})
      : super(
          settings: page,
          builder: (context) => const LoginScreen(),
        );
}

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Form(),
          ],
        ),
      ),
    );
  }
}

class _Form extends HookWidget {
  _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              onChanged: (value) =>
                  context.read<LoginFormCubit>().updateEmail(value),
              decoration: InputDecoration(
                label: const Text('email'),
                errorText: state.email.error,
              ),
            ).columnPadded24,
            const SizedBox(height: 16),
            TextFormField(
              onChanged: (value) =>
                  context.read<LoginFormCubit>().updatePassword(value),
              decoration: InputDecoration(
                label: const Text('password'),
                errorText: state.password.error,
              ),
              obscureText: true,
            ).columnPadded24,
            const SizedBox(height: 48),
            if (state.error)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Wrong email or password',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed:
                  state.email.error != null || state.password.error != null
                      ? null
                      : () => context.read<LoginFormCubit>().tryLogin(),
              child: const Text('Zaloguj'),
            ),
            ElevatedButton(
              onPressed: () => context.read<AuthStateCubit>().signOut(),
              child: const Text('Wyloguj'),
            )
          ],
        );
      },
    );
  }
}

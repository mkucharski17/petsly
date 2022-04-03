import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/features/auth/bloc/login_form_cubit.dart';
import 'package:petsly/features/auth/registration_page.dart';
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 128),
              Image.asset(
                'assets/petsly_logo.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 64),
              const _Form(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends HookWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 78,
                child: TextFormField(
                  onChanged: (value) =>
                      context.read<LoginFormCubit>().updateEmail(value),
                  decoration: InputDecoration(
                    label: const Text('email'),
                    errorText: state.email.error,
                  ),
                ).columnPadded24,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 78,
                child: TextFormField(
                  onChanged: (value) =>
                      context.read<LoginFormCubit>().updatePassword(value),
                  decoration: InputDecoration(
                    label: const Text('password'),
                    errorText: state.password.error,
                  ),
                  obscureText: true,
                ).columnPadded24,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 128,
                child: ElevatedButton(
                  onPressed:
                      state.email.error != null || state.password.error != null
                          ? null
                          : () => context.read<LoginFormCubit>().tryLogin(),
                  child: const Text('Zaloguj'),
                ),
              ),
              if (state.error)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Złe hasło lub e-mail',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const Spacer(),
              const _DoNotHaveAccount(),
            ],
          ),
        );
      },
    );
  }
}

class _DoNotHaveAccount extends StatelessWidget {
  const _DoNotHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Nie masz konta?',
          style: TextStyle(fontSize: 14),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).push(RegistrationScreenRoute()),
          child: const Text(
            'Zarejestruj się',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}

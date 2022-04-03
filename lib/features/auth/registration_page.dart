import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/features/auth/bloc/registration_form_cubit.dart';
import 'package:petsly/ui/ui.dart';

class RegistrationPage extends Page<void> {
  const RegistrationPage({LocalKey? key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) =>
      RegistrationScreenRoute(page: this);
}

class RegistrationScreenRoute extends MaterialPageRoute<void> {
  RegistrationScreenRoute({RegistrationPage? page})
      : super(
          settings: page,
          builder: (context) => const RegistrationScreen(),
        );
}

class RegistrationScreen extends HookWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFormCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stwórz konto'),
        ),
        body: SafeArea(
          child: Column(
            children: [
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
    return BlocBuilder<RegistrationFormCubit, RegistrationFormState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 78,
                child: TextFormField(
                  onChanged: (value) =>
                      context.read<RegistrationFormCubit>().updateEmail(value),
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
                  onChanged: (value) => context
                      .read<RegistrationFormCubit>()
                      .updatePassword(value),
                  decoration: InputDecoration(
                    label: const Text('password'),
                    errorText: state.password.error,
                  ),
                  obscureText: true,
                ).columnPadded24,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 128,
                child: ElevatedButton(
                  onPressed:
                      state.email.error != null || state.password.error != null
                          ? null
                          : () => context
                              .read<RegistrationFormCubit>()
                              .tryRegistration(),
                  child: const Text('Zarejestruj'),
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
          onPressed: () {},
          child: const Text(
            'Zarejestruj',
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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/auth/init_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(PetslyApp());
}

class PetslyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _GlobalProviders(
      app: MaterialApp(
        title: 'Petsly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(primary: Colors.blueAccent),
          fontFamily: 'LexendDeca',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(),
          fontFamily: 'LexendDeca',
        ),
        home: const InitLoader(),
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({Key? key, required this.app}) : super(key: key);

  final MaterialApp app;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (create) => AuthStateCubit(),
        ),
      ],
      child: app,
    );
  }
}

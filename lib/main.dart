import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:location/location.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/auth/bloc/registration_form_cubit.dart';
import 'package:petsly/features/auth/init_page.dart';
import 'package:petsly/features/chat/bloc/conversation_list_cubit.dart';
import 'package:petsly/features/location/location_service.dart';
import 'package:petsly/features/location/location_source.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting();

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
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Firestore(),
        ),
        Provider(
          create: (context) => LocationService(Location()),
        ),
        Provider(
          create: (context) => LocationSource(
            context.read(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationFormCubit(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => AuthStateCubit(
              registrationFormCubit: context.read(),
              firestore: context.read(),
            ),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => ConversationListCubit(
              firestore: context.read(),
            ),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => OffersCubit(
              firestore: context.read(),
            ),
          ),
        ],
        child: app,
      ),
    );
  }
}

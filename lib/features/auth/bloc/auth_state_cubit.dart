import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/features/auth/bloc/registration_form_cubit.dart';

part 'auth_state_cubit.freezed.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit({
    required this.firestore,
    required this.registrationFormCubit,
  }) : super(const AuthState.notLoggedIn()) {
    _authStateSubscription =
        FirebaseAuth.instance.authStateChanges().listen(_handleAuthStateChange);
  }

  late final StreamSubscription _authStateSubscription;
  final RegistrationFormCubit registrationFormCubit;
  final Firestore firestore;
  final _logger = Logger();

  void _handleAuthStateChange(User? user) {
    print(user);
    if (user == null) {
      emit(const AuthState.notLoggedIn());
    } else {
      emit(AuthState.loggedIn(user: user));

      if (registrationFormCubit.state.email.field != null)
        _addUserData(
          id: user.uid,
          phone: registrationFormCubit.state.phone.field,
          name: registrationFormCubit.state.name.field,
        );
    }
  }

  void signOut() => FirebaseAuth.instance.signOut();

  void deleteUser() {
    FirebaseAuth.instance.currentUser!.delete();
    signOut();
  }

  Future<void> _addUserData({
    required String id,
    required String phone,
    required String name,
  }) {
    return firestore
        .getCollection('users')
        .add({
          'id': id,
          'name': name,
          'phone': phone,
        })
        .then((value) => _logger.i('User Added'))
        .catchError((error) => _logger.e('Failed to add user: $error'));
  }

  @override
  Future<void> close() async {
    await _authStateSubscription.cancel();
    return super.close();
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn({
    required User user,
  }) = _LoggedIn;

  const factory AuthState.notLoggedIn() = _NotLoggedIn;
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state_cubit.freezed.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(const AuthState.notLoggedIn()) {
    _authStateSubscription =
        FirebaseAuth.instance.authStateChanges().listen(_handleAuthStateChange);
  }

  late final StreamSubscription _authStateSubscription;

  void _handleAuthStateChange(User? user) {
    print(user);
    if (user == null) {
      emit(const AuthState.notLoggedIn());
    } else {
      emit(AuthState.loggedIn(user: user));
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
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

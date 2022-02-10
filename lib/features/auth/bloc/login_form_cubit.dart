import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:petsly/data/auth/auth.dart';
import 'package:petsly/utils/utils.dart';

part 'login_form_cubit.freezed.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit()
      : super(
          const LoginFormState(
            email: FormField<String?>(validator: EmailValidator.isValid),
            password: FormField<String?>(validator: PasswordValidator.isValid),
          ),
        );

  final _auth = FirebaseAuth.instance;
  final _logger = Logger();

  void updateEmail(String value) {
    final email = state.email.copyWith(field: value);

    emit(state.copyWith(
      email: email.validate('Wrong email format'),
      error: false,
    ));
  }

  void updatePassword(String value) {
    final password = state.password.copyWith(field: value);

    emit(
      state.copyWith(
        password: password.validate('Password must have at least 6 characters'),
        error: false,
      ),
    );
  }

  Future<void> tryLogin() async {
    emit(state.copyWith(loading: true));
    try {
      await _auth.signInWithEmailAndPassword(
        email: state.email.field,
        password: state.password.field,
      );
      _logger.e('Singed in successfully');

      emit(state.copyWith(loading: false));
    } catch (e) {
      _logger.e('Sing in with email and password failed: $e');
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }
  }
}

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default(FormField()) FormField email,
    @Default(FormField()) FormField password,
    @Default(false) bool loading,
    @Default(false) bool error,
  }) = _LoginFormState;
}

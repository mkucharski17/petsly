import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:petsly/data/auth/auth.dart';
import 'package:petsly/utils/utils.dart';

part 'registration_form_cubit.freezed.dart';

class RegistrationFormCubit extends Cubit<RegistrationFormState> {
  RegistrationFormCubit()
      : super(
          const RegistrationFormState(
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

  Future<void> tryRegistration() async {
    emit(state.copyWith(loading: true));
    try {
      await _auth.createUserWithEmailAndPassword(
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
class RegistrationFormState with _$RegistrationFormState {
  const factory RegistrationFormState({
    @Default(FormField()) FormField email,
    @Default(FormField()) FormField password,
    @Default(false) bool loading,
    @Default(false) bool error,
  }) = _RegistrationFormState;
}

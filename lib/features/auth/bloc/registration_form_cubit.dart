import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:petsly/data/auth/auth.dart';
import 'package:petsly/utils/utils.dart';
import 'package:petsly/utils/validator/name_valdiator.dart';
import 'package:petsly/utils/validator/phone_validator.dart';

part 'registration_form_cubit.freezed.dart';

class RegistrationFormCubit extends Cubit<RegistrationFormState> {
  RegistrationFormCubit()
      : super(
          const RegistrationFormState(
            email: FormField<String?>(validator: EmailValidator.isValid),
            password: FormField<String?>(validator: PasswordValidator.isValid),
            phone: FormField<String?>(validator: PhoneValidator.isValid),
            name: FormField<String?>(validator: NameValidator.isValid),
          ),
        );

  final _auth = FirebaseAuth.instance;
  final _logger = Logger();

  void updateEmail(String value) {
    final email = state.email.copyWith(field: value);

    emit(state.copyWith(
      email: email.validate('Format adresu e-mail jest niepoprawny'),
      error: false,
    ));
  }

  void updatePassword(String value) {
    final password = state.password.copyWith(field: value);

    emit(
      state.copyWith(
        password: password.validate('Hasło musi mieć więcej niż 6 znaków '),
        error: false,
      ),
    );
  }

  void updateName(String value) {
    final name = state.name.copyWith(field: value);

    emit(
      state.copyWith(
        name: name.validate('Imię nie może być puste'),
        error: false,
      ),
    );
  }

  void updatePhone(String value) {
    final phone = state.phone.copyWith(field: value);

    emit(
      state.copyWith(
        phone: phone.validate('Telefon musi mieć 9 cyfr'),
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

      _logger.i('Singed in successfully');

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
    @Default(FormField()) FormField phone,
    @Default(FormField()) FormField name,
    @Default(false) bool loading,
    @Default(false) bool error,
  }) = _RegistrationFormState;
}

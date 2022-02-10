// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginFormStateTearOff {
  const _$LoginFormStateTearOff();

  _LoginFormState call(
      {FormField<dynamic> email = const FormField(),
      FormField<dynamic> password = const FormField(),
      bool loading = false,
      bool error = false}) {
    return _LoginFormState(
      email: email,
      password: password,
      loading: loading,
      error: error,
    );
  }
}

/// @nodoc
const $LoginFormState = _$LoginFormStateTearOff();

/// @nodoc
mixin _$LoginFormState {
  FormField<dynamic> get email => throw _privateConstructorUsedError;
  FormField<dynamic> get password => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res>;
  $Res call(
      {FormField<dynamic> email,
      FormField<dynamic> password,
      bool loading,
      bool error});

  $FormFieldCopyWith<dynamic, $Res> get email;
  $FormFieldCopyWith<dynamic, $Res> get password;
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  final LoginFormState _value;
  // ignore: unused_field
  final $Res Function(LoginFormState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormField<dynamic>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormField<dynamic>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FormFieldCopyWith<dynamic, $Res> get email {
    return $FormFieldCopyWith<dynamic, $Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value));
    });
  }

  @override
  $FormFieldCopyWith<dynamic, $Res> get password {
    return $FormFieldCopyWith<dynamic, $Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value));
    });
  }
}

/// @nodoc
abstract class _$LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$LoginFormStateCopyWith(
          _LoginFormState value, $Res Function(_LoginFormState) then) =
      __$LoginFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormField<dynamic> email,
      FormField<dynamic> password,
      bool loading,
      bool error});

  @override
  $FormFieldCopyWith<dynamic, $Res> get email;
  @override
  $FormFieldCopyWith<dynamic, $Res> get password;
}

/// @nodoc
class __$LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res>
    implements _$LoginFormStateCopyWith<$Res> {
  __$LoginFormStateCopyWithImpl(
      _LoginFormState _value, $Res Function(_LoginFormState) _then)
      : super(_value, (v) => _then(v as _LoginFormState));

  @override
  _LoginFormState get _value => super._value as _LoginFormState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? loading = freezed,
    Object? error = freezed,
  }) {
    return _then(_LoginFormState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormField<dynamic>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormField<dynamic>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginFormState implements _LoginFormState {
  const _$_LoginFormState(
      {this.email = const FormField(),
      this.password = const FormField(),
      this.loading = false,
      this.error = false});

  @JsonKey()
  @override
  final FormField<dynamic> email;
  @JsonKey()
  @override
  final FormField<dynamic> password;
  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final bool error;

  @override
  String toString() {
    return 'LoginFormState(email: $email, password: $password, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginFormState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$LoginFormStateCopyWith<_LoginFormState> get copyWith =>
      __$LoginFormStateCopyWithImpl<_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState(
      {FormField<dynamic> email,
      FormField<dynamic> password,
      bool loading,
      bool error}) = _$_LoginFormState;

  @override
  FormField<dynamic> get email;
  @override
  FormField<dynamic> get password;
  @override
  bool get loading;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$LoginFormStateCopyWith<_LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

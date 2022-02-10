// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FormFieldTearOff {
  const _$FormFieldTearOff();

  _FormField<T> call<T>({T? field, String? error, Validator<T?>? validator}) {
    return _FormField<T>(
      field: field,
      error: error,
      validator: validator,
    );
  }
}

/// @nodoc
const $FormField = _$FormFieldTearOff();

/// @nodoc
mixin _$FormField<T> {
  T? get field => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Validator<T?>? get validator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFieldCopyWith<T, FormField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldCopyWith<T, $Res> {
  factory $FormFieldCopyWith(
          FormField<T> value, $Res Function(FormField<T>) then) =
      _$FormFieldCopyWithImpl<T, $Res>;
  $Res call({T? field, String? error, Validator<T?>? validator});
}

/// @nodoc
class _$FormFieldCopyWithImpl<T, $Res> implements $FormFieldCopyWith<T, $Res> {
  _$FormFieldCopyWithImpl(this._value, this._then);

  final FormField<T> _value;
  // ignore: unused_field
  final $Res Function(FormField<T>) _then;

  @override
  $Res call({
    Object? field = freezed,
    Object? error = freezed,
    Object? validator = freezed,
  }) {
    return _then(_value.copyWith(
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as T?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator<T?>?,
    ));
  }
}

/// @nodoc
abstract class _$FormFieldCopyWith<T, $Res>
    implements $FormFieldCopyWith<T, $Res> {
  factory _$FormFieldCopyWith(
          _FormField<T> value, $Res Function(_FormField<T>) then) =
      __$FormFieldCopyWithImpl<T, $Res>;
  @override
  $Res call({T? field, String? error, Validator<T?>? validator});
}

/// @nodoc
class __$FormFieldCopyWithImpl<T, $Res> extends _$FormFieldCopyWithImpl<T, $Res>
    implements _$FormFieldCopyWith<T, $Res> {
  __$FormFieldCopyWithImpl(
      _FormField<T> _value, $Res Function(_FormField<T>) _then)
      : super(_value, (v) => _then(v as _FormField<T>));

  @override
  _FormField<T> get _value => super._value as _FormField<T>;

  @override
  $Res call({
    Object? field = freezed,
    Object? error = freezed,
    Object? validator = freezed,
  }) {
    return _then(_FormField<T>(
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as T?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as Validator<T?>?,
    ));
  }
}

/// @nodoc

class _$_FormField<T> extends _FormField<T> {
  const _$_FormField({this.field, this.error, this.validator}) : super._();

  @override
  final T? field;
  @override
  final String? error;
  @override
  final Validator<T?>? validator;

  @override
  String toString() {
    return 'FormField<$T>(field: $field, error: $error, validator: $validator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormField<T> &&
            const DeepCollectionEquality().equals(other.field, field) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.validator, validator) ||
                other.validator == validator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(field),
      const DeepCollectionEquality().hash(error),
      validator);

  @JsonKey(ignore: true)
  @override
  _$FormFieldCopyWith<T, _FormField<T>> get copyWith =>
      __$FormFieldCopyWithImpl<T, _FormField<T>>(this, _$identity);
}

abstract class _FormField<T> extends FormField<T> {
  const factory _FormField(
      {T? field, String? error, Validator<T?>? validator}) = _$_FormField<T>;
  const _FormField._() : super._();

  @override
  T? get field;
  @override
  String? get error;
  @override
  Validator<T?>? get validator;
  @override
  @JsonKey(ignore: true)
  _$FormFieldCopyWith<T, _FormField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

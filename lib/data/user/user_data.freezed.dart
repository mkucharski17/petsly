// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
class _$UserDataTearOff {
  const _$UserDataTearOff();

  _UserData call(
      {required String id,
      required String name,
      required String email,
      required String? description,
      required String? phone,
      required String? photoUrl,
      List<String> favourites = const [],
      List<Rate> rates = const []}) {
    return _UserData(
      id: id,
      name: name,
      email: email,
      description: description,
      phone: phone,
      photoUrl: photoUrl,
      favourites: favourites,
      rates: rates,
    );
  }

  UserData fromJson(Map<String, Object?> json) {
    return UserData.fromJson(json);
  }
}

/// @nodoc
const $UserData = _$UserDataTearOff();

/// @nodoc
mixin _$UserData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<String> get favourites => throw _privateConstructorUsedError;
  List<Rate> get rates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String email,
      String? description,
      String? phone,
      String? photoUrl,
      List<String> favourites,
      List<Rate> rates});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? phone = freezed,
    Object? photoUrl = freezed,
    Object? favourites = freezed,
    Object? rates = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favourites: favourites == freezed
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rates: rates == freezed
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>,
    ));
  }
}

/// @nodoc
abstract class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) then) =
      __$UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String email,
      String? description,
      String? phone,
      String? photoUrl,
      List<String> favourites,
      List<Rate> rates});
}

/// @nodoc
class __$UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(_UserData _value, $Res Function(_UserData) _then)
      : super(_value, (v) => _then(v as _UserData));

  @override
  _UserData get _value => super._value as _UserData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? phone = freezed,
    Object? photoUrl = freezed,
    Object? favourites = freezed,
    Object? rates = freezed,
  }) {
    return _then(_UserData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favourites: favourites == freezed
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rates: rates == freezed
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData implements _UserData {
  const _$_UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.description,
      required this.phone,
      required this.photoUrl,
      this.favourites = const [],
      this.rates = const []});

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? description;
  @override
  final String? phone;
  @override
  final String? photoUrl;
  @JsonKey()
  @override
  final List<String> favourites;
  @JsonKey()
  @override
  final List<Rate> rates;

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, description: $description, phone: $phone, photoUrl: $photoUrl, favourites: $favourites, rates: $rates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.favourites, favourites) &&
            const DeepCollectionEquality().equals(other.rates, rates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(favourites),
      const DeepCollectionEquality().hash(rates));

  @JsonKey(ignore: true)
  @override
  _$UserDataCopyWith<_UserData> get copyWith =>
      __$UserDataCopyWithImpl<_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required String id,
      required String name,
      required String email,
      required String? description,
      required String? phone,
      required String? photoUrl,
      List<String> favourites,
      List<Rate> rates}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get description;
  @override
  String? get phone;
  @override
  String? get photoUrl;
  @override
  List<String> get favourites;
  @override
  List<Rate> get rates;
  @override
  @JsonKey(ignore: true)
  _$UserDataCopyWith<_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

Rate _$RateFromJson(Map<String, dynamic> json) {
  return _Rate.fromJson(json);
}

/// @nodoc
class _$RateTearOff {
  const _$RateTearOff();

  _Rate call({required int rate, required String textRate}) {
    return _Rate(
      rate: rate,
      textRate: textRate,
    );
  }

  Rate fromJson(Map<String, Object?> json) {
    return Rate.fromJson(json);
  }
}

/// @nodoc
const $Rate = _$RateTearOff();

/// @nodoc
mixin _$Rate {
  int get rate => throw _privateConstructorUsedError;
  String get textRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateCopyWith<Rate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateCopyWith<$Res> {
  factory $RateCopyWith(Rate value, $Res Function(Rate) then) =
      _$RateCopyWithImpl<$Res>;
  $Res call({int rate, String textRate});
}

/// @nodoc
class _$RateCopyWithImpl<$Res> implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._value, this._then);

  final Rate _value;
  // ignore: unused_field
  final $Res Function(Rate) _then;

  @override
  $Res call({
    Object? rate = freezed,
    Object? textRate = freezed,
  }) {
    return _then(_value.copyWith(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      textRate: textRate == freezed
          ? _value.textRate
          : textRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RateCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$RateCopyWith(_Rate value, $Res Function(_Rate) then) =
      __$RateCopyWithImpl<$Res>;
  @override
  $Res call({int rate, String textRate});
}

/// @nodoc
class __$RateCopyWithImpl<$Res> extends _$RateCopyWithImpl<$Res>
    implements _$RateCopyWith<$Res> {
  __$RateCopyWithImpl(_Rate _value, $Res Function(_Rate) _then)
      : super(_value, (v) => _then(v as _Rate));

  @override
  _Rate get _value => super._value as _Rate;

  @override
  $Res call({
    Object? rate = freezed,
    Object? textRate = freezed,
  }) {
    return _then(_Rate(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      textRate: textRate == freezed
          ? _value.textRate
          : textRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rate implements _Rate {
  const _$_Rate({required this.rate, required this.textRate});

  factory _$_Rate.fromJson(Map<String, dynamic> json) => _$$_RateFromJson(json);

  @override
  final int rate;
  @override
  final String textRate;

  @override
  String toString() {
    return 'Rate(rate: $rate, textRate: $textRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Rate &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.textRate, textRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(textRate));

  @JsonKey(ignore: true)
  @override
  _$RateCopyWith<_Rate> get copyWith =>
      __$RateCopyWithImpl<_Rate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateToJson(this);
  }
}

abstract class _Rate implements Rate {
  const factory _Rate({required int rate, required String textRate}) = _$_Rate;

  factory _Rate.fromJson(Map<String, dynamic> json) = _$_Rate.fromJson;

  @override
  int get rate;
  @override
  String get textRate;
  @override
  @JsonKey(ignore: true)
  _$RateCopyWith<_Rate> get copyWith => throw _privateConstructorUsedError;
}

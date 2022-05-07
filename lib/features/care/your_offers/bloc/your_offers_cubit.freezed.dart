// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'your_offers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$YourOffersStateTearOff {
  const _$YourOffersStateTearOff();

  _YourOffersState call(
      {bool loading = true,
      List<QueryDocumentSnapshot<Offer>> yourOfferList = const []}) {
    return _YourOffersState(
      loading: loading,
      yourOfferList: yourOfferList,
    );
  }
}

/// @nodoc
const $YourOffersState = _$YourOffersStateTearOff();

/// @nodoc
mixin _$YourOffersState {
  bool get loading => throw _privateConstructorUsedError;
  List<QueryDocumentSnapshot<Offer>> get yourOfferList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YourOffersStateCopyWith<YourOffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YourOffersStateCopyWith<$Res> {
  factory $YourOffersStateCopyWith(
          YourOffersState value, $Res Function(YourOffersState) then) =
      _$YourOffersStateCopyWithImpl<$Res>;
  $Res call({bool loading, List<QueryDocumentSnapshot<Offer>> yourOfferList});
}

/// @nodoc
class _$YourOffersStateCopyWithImpl<$Res>
    implements $YourOffersStateCopyWith<$Res> {
  _$YourOffersStateCopyWithImpl(this._value, this._then);

  final YourOffersState _value;
  // ignore: unused_field
  final $Res Function(YourOffersState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? yourOfferList = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      yourOfferList: yourOfferList == freezed
          ? _value.yourOfferList
          : yourOfferList // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
    ));
  }
}

/// @nodoc
abstract class _$YourOffersStateCopyWith<$Res>
    implements $YourOffersStateCopyWith<$Res> {
  factory _$YourOffersStateCopyWith(
          _YourOffersState value, $Res Function(_YourOffersState) then) =
      __$YourOffersStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, List<QueryDocumentSnapshot<Offer>> yourOfferList});
}

/// @nodoc
class __$YourOffersStateCopyWithImpl<$Res>
    extends _$YourOffersStateCopyWithImpl<$Res>
    implements _$YourOffersStateCopyWith<$Res> {
  __$YourOffersStateCopyWithImpl(
      _YourOffersState _value, $Res Function(_YourOffersState) _then)
      : super(_value, (v) => _then(v as _YourOffersState));

  @override
  _YourOffersState get _value => super._value as _YourOffersState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? yourOfferList = freezed,
  }) {
    return _then(_YourOffersState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      yourOfferList: yourOfferList == freezed
          ? _value.yourOfferList
          : yourOfferList // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
    ));
  }
}

/// @nodoc

class _$_YourOffersState implements _YourOffersState {
  const _$_YourOffersState(
      {this.loading = true, this.yourOfferList = const []});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final List<QueryDocumentSnapshot<Offer>> yourOfferList;

  @override
  String toString() {
    return 'YourOffersState(loading: $loading, yourOfferList: $yourOfferList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YourOffersState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.yourOfferList, yourOfferList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(yourOfferList));

  @JsonKey(ignore: true)
  @override
  _$YourOffersStateCopyWith<_YourOffersState> get copyWith =>
      __$YourOffersStateCopyWithImpl<_YourOffersState>(this, _$identity);
}

abstract class _YourOffersState implements YourOffersState {
  const factory _YourOffersState(
      {bool loading,
      List<QueryDocumentSnapshot<Offer>> yourOfferList}) = _$_YourOffersState;

  @override
  bool get loading;
  @override
  List<QueryDocumentSnapshot<Offer>> get yourOfferList;
  @override
  @JsonKey(ignore: true)
  _$YourOffersStateCopyWith<_YourOffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

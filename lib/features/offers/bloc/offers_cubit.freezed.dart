// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OffersStateTearOff {
  const _$OffersStateTearOff();

  _OffersState call(
      {bool loading = true,
      List<QueryDocumentSnapshot<Offer>> offers = const []}) {
    return _OffersState(
      loading: loading,
      offers: offers,
    );
  }
}

/// @nodoc
const $OffersState = _$OffersStateTearOff();

/// @nodoc
mixin _$OffersState {
  bool get loading => throw _privateConstructorUsedError;
  List<QueryDocumentSnapshot<Offer>> get offers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OffersStateCopyWith<OffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersStateCopyWith<$Res> {
  factory $OffersStateCopyWith(
          OffersState value, $Res Function(OffersState) then) =
      _$OffersStateCopyWithImpl<$Res>;
  $Res call({bool loading, List<QueryDocumentSnapshot<Offer>> offers});
}

/// @nodoc
class _$OffersStateCopyWithImpl<$Res> implements $OffersStateCopyWith<$Res> {
  _$OffersStateCopyWithImpl(this._value, this._then);

  final OffersState _value;
  // ignore: unused_field
  final $Res Function(OffersState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? offers = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      offers: offers == freezed
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
    ));
  }
}

/// @nodoc
abstract class _$OffersStateCopyWith<$Res>
    implements $OffersStateCopyWith<$Res> {
  factory _$OffersStateCopyWith(
          _OffersState value, $Res Function(_OffersState) then) =
      __$OffersStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, List<QueryDocumentSnapshot<Offer>> offers});
}

/// @nodoc
class __$OffersStateCopyWithImpl<$Res> extends _$OffersStateCopyWithImpl<$Res>
    implements _$OffersStateCopyWith<$Res> {
  __$OffersStateCopyWithImpl(
      _OffersState _value, $Res Function(_OffersState) _then)
      : super(_value, (v) => _then(v as _OffersState));

  @override
  _OffersState get _value => super._value as _OffersState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? offers = freezed,
  }) {
    return _then(_OffersState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      offers: offers == freezed
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
    ));
  }
}

/// @nodoc

class _$_OffersState implements _OffersState {
  const _$_OffersState({this.loading = true, this.offers = const []});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final List<QueryDocumentSnapshot<Offer>> offers;

  @override
  String toString() {
    return 'OffersState(loading: $loading, offers: $offers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OffersState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.offers, offers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(offers));

  @JsonKey(ignore: true)
  @override
  _$OffersStateCopyWith<_OffersState> get copyWith =>
      __$OffersStateCopyWithImpl<_OffersState>(this, _$identity);
}

abstract class _OffersState implements OffersState {
  const factory _OffersState(
      {bool loading,
      List<QueryDocumentSnapshot<Offer>> offers}) = _$_OffersState;

  @override
  bool get loading;
  @override
  List<QueryDocumentSnapshot<Offer>> get offers;
  @override
  @JsonKey(ignore: true)
  _$OffersStateCopyWith<_OffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

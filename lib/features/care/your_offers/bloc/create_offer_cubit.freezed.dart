// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_offer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateOfferStateTearOff {
  const _$CreateOfferStateTearOff();

  _CreateOfferState call({required Offer offer}) {
    return _CreateOfferState(
      offer: offer,
    );
  }
}

/// @nodoc
const $CreateOfferState = _$CreateOfferStateTearOff();

/// @nodoc
mixin _$CreateOfferState {
  Offer get offer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateOfferStateCopyWith<CreateOfferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOfferStateCopyWith<$Res> {
  factory $CreateOfferStateCopyWith(
          CreateOfferState value, $Res Function(CreateOfferState) then) =
      _$CreateOfferStateCopyWithImpl<$Res>;
  $Res call({Offer offer});

  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class _$CreateOfferStateCopyWithImpl<$Res>
    implements $CreateOfferStateCopyWith<$Res> {
  _$CreateOfferStateCopyWithImpl(this._value, this._then);

  final CreateOfferState _value;
  // ignore: unused_field
  final $Res Function(CreateOfferState) _then;

  @override
  $Res call({
    Object? offer = freezed,
  }) {
    return _then(_value.copyWith(
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
    ));
  }

  @override
  $OfferCopyWith<$Res> get offer {
    return $OfferCopyWith<$Res>(_value.offer, (value) {
      return _then(_value.copyWith(offer: value));
    });
  }
}

/// @nodoc
abstract class _$CreateOfferStateCopyWith<$Res>
    implements $CreateOfferStateCopyWith<$Res> {
  factory _$CreateOfferStateCopyWith(
          _CreateOfferState value, $Res Function(_CreateOfferState) then) =
      __$CreateOfferStateCopyWithImpl<$Res>;
  @override
  $Res call({Offer offer});

  @override
  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class __$CreateOfferStateCopyWithImpl<$Res>
    extends _$CreateOfferStateCopyWithImpl<$Res>
    implements _$CreateOfferStateCopyWith<$Res> {
  __$CreateOfferStateCopyWithImpl(
      _CreateOfferState _value, $Res Function(_CreateOfferState) _then)
      : super(_value, (v) => _then(v as _CreateOfferState));

  @override
  _CreateOfferState get _value => super._value as _CreateOfferState;

  @override
  $Res call({
    Object? offer = freezed,
  }) {
    return _then(_CreateOfferState(
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
    ));
  }
}

/// @nodoc

class _$_CreateOfferState implements _CreateOfferState {
  const _$_CreateOfferState({required this.offer});

  @override
  final Offer offer;

  @override
  String toString() {
    return 'CreateOfferState(offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateOfferState &&
            const DeepCollectionEquality().equals(other.offer, offer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(offer));

  @JsonKey(ignore: true)
  @override
  _$CreateOfferStateCopyWith<_CreateOfferState> get copyWith =>
      __$CreateOfferStateCopyWithImpl<_CreateOfferState>(this, _$identity);
}

abstract class _CreateOfferState implements CreateOfferState {
  const factory _CreateOfferState({required Offer offer}) = _$_CreateOfferState;

  @override
  Offer get offer;
  @override
  @JsonKey(ignore: true)
  _$CreateOfferStateCopyWith<_CreateOfferState> get copyWith =>
      throw _privateConstructorUsedError;
}

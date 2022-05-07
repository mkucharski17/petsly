// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_offer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditOfferStateTearOff {
  const _$EditOfferStateTearOff();

  _EditOfferState call({required Offer offer, required bool changed}) {
    return _EditOfferState(
      offer: offer,
      changed: changed,
    );
  }
}

/// @nodoc
const $EditOfferState = _$EditOfferStateTearOff();

/// @nodoc
mixin _$EditOfferState {
  Offer get offer => throw _privateConstructorUsedError;
  bool get changed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditOfferStateCopyWith<EditOfferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditOfferStateCopyWith<$Res> {
  factory $EditOfferStateCopyWith(
          EditOfferState value, $Res Function(EditOfferState) then) =
      _$EditOfferStateCopyWithImpl<$Res>;
  $Res call({Offer offer, bool changed});

  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class _$EditOfferStateCopyWithImpl<$Res>
    implements $EditOfferStateCopyWith<$Res> {
  _$EditOfferStateCopyWithImpl(this._value, this._then);

  final EditOfferState _value;
  // ignore: unused_field
  final $Res Function(EditOfferState) _then;

  @override
  $Res call({
    Object? offer = freezed,
    Object? changed = freezed,
  }) {
    return _then(_value.copyWith(
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
      changed: changed == freezed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$EditOfferStateCopyWith<$Res>
    implements $EditOfferStateCopyWith<$Res> {
  factory _$EditOfferStateCopyWith(
          _EditOfferState value, $Res Function(_EditOfferState) then) =
      __$EditOfferStateCopyWithImpl<$Res>;
  @override
  $Res call({Offer offer, bool changed});

  @override
  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class __$EditOfferStateCopyWithImpl<$Res>
    extends _$EditOfferStateCopyWithImpl<$Res>
    implements _$EditOfferStateCopyWith<$Res> {
  __$EditOfferStateCopyWithImpl(
      _EditOfferState _value, $Res Function(_EditOfferState) _then)
      : super(_value, (v) => _then(v as _EditOfferState));

  @override
  _EditOfferState get _value => super._value as _EditOfferState;

  @override
  $Res call({
    Object? offer = freezed,
    Object? changed = freezed,
  }) {
    return _then(_EditOfferState(
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
      changed: changed == freezed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditOfferState implements _EditOfferState {
  const _$_EditOfferState({required this.offer, required this.changed});

  @override
  final Offer offer;
  @override
  final bool changed;

  @override
  String toString() {
    return 'EditOfferState(offer: $offer, changed: $changed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditOfferState &&
            const DeepCollectionEquality().equals(other.offer, offer) &&
            const DeepCollectionEquality().equals(other.changed, changed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(offer),
      const DeepCollectionEquality().hash(changed));

  @JsonKey(ignore: true)
  @override
  _$EditOfferStateCopyWith<_EditOfferState> get copyWith =>
      __$EditOfferStateCopyWithImpl<_EditOfferState>(this, _$identity);
}

abstract class _EditOfferState implements EditOfferState {
  const factory _EditOfferState({required Offer offer, required bool changed}) =
      _$_EditOfferState;

  @override
  Offer get offer;
  @override
  bool get changed;
  @override
  @JsonKey(ignore: true)
  _$EditOfferStateCopyWith<_EditOfferState> get copyWith =>
      throw _privateConstructorUsedError;
}

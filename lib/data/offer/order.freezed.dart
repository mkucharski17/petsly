// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

  _Order call(
      {required String clientId,
      required Offer offer,
      required OrderStatus status,
      required List<DateTime> days}) {
    return _Order(
      clientId: clientId,
      offer: offer,
      status: status,
      days: days,
    );
  }

  Order fromJson(Map<String, Object?> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  String get clientId => throw _privateConstructorUsedError;
  Offer get offer => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  List<DateTime> get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {String clientId, Offer offer, OrderStatus status, List<DateTime> days});

  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? offer = freezed,
    Object? status = freezed,
    Object? days = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
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
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String clientId, Offer offer, OrderStatus status, List<DateTime> days});

  @override
  $OfferCopyWith<$Res> get offer;
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? offer = freezed,
    Object? status = freezed,
    Object? days = freezed,
  }) {
    return _then(_Order(
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  const _$_Order(
      {required this.clientId,
      required this.offer,
      required this.status,
      required this.days});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String clientId;
  @override
  final Offer offer;
  @override
  final OrderStatus status;
  @override
  final List<DateTime> days;

  @override
  String toString() {
    return 'Order(clientId: $clientId, offer: $offer, status: $status, days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Order &&
            const DeepCollectionEquality().equals(other.clientId, clientId) &&
            const DeepCollectionEquality().equals(other.offer, offer) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clientId),
      const DeepCollectionEquality().hash(offer),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(days));

  @JsonKey(ignore: true)
  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required String clientId,
      required Offer offer,
      required OrderStatus status,
      required List<DateTime> days}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get clientId;
  @override
  Offer get offer;
  @override
  OrderStatus get status;
  @override
  List<DateTime> get days;
  @override
  @JsonKey(ignore: true)
  _$OrderCopyWith<_Order> get copyWith => throw _privateConstructorUsedError;
}

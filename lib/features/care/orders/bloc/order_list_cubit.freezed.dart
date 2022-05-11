// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderListStateTearOff {
  const _$OrderListStateTearOff();

  _OrderListState call(
      {List<Order> orderList = const [], bool loading = false}) {
    return _OrderListState(
      orderList: orderList,
      loading: loading,
    );
  }
}

/// @nodoc
const $OrderListState = _$OrderListStateTearOff();

/// @nodoc
mixin _$OrderListState {
  List<Order> get orderList => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderListStateCopyWith<OrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListStateCopyWith<$Res> {
  factory $OrderListStateCopyWith(
          OrderListState value, $Res Function(OrderListState) then) =
      _$OrderListStateCopyWithImpl<$Res>;
  $Res call({List<Order> orderList, bool loading});
}

/// @nodoc
class _$OrderListStateCopyWithImpl<$Res>
    implements $OrderListStateCopyWith<$Res> {
  _$OrderListStateCopyWithImpl(this._value, this._then);

  final OrderListState _value;
  // ignore: unused_field
  final $Res Function(OrderListState) _then;

  @override
  $Res call({
    Object? orderList = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      orderList: orderList == freezed
          ? _value.orderList
          : orderList // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OrderListStateCopyWith<$Res>
    implements $OrderListStateCopyWith<$Res> {
  factory _$OrderListStateCopyWith(
          _OrderListState value, $Res Function(_OrderListState) then) =
      __$OrderListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Order> orderList, bool loading});
}

/// @nodoc
class __$OrderListStateCopyWithImpl<$Res>
    extends _$OrderListStateCopyWithImpl<$Res>
    implements _$OrderListStateCopyWith<$Res> {
  __$OrderListStateCopyWithImpl(
      _OrderListState _value, $Res Function(_OrderListState) _then)
      : super(_value, (v) => _then(v as _OrderListState));

  @override
  _OrderListState get _value => super._value as _OrderListState;

  @override
  $Res call({
    Object? orderList = freezed,
    Object? loading = freezed,
  }) {
    return _then(_OrderListState(
      orderList: orderList == freezed
          ? _value.orderList
          : orderList // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderListState implements _OrderListState {
  const _$_OrderListState({this.orderList = const [], this.loading = false});

  @JsonKey()
  @override
  final List<Order> orderList;
  @JsonKey()
  @override
  final bool loading;

  @override
  String toString() {
    return 'OrderListState(orderList: $orderList, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderListState &&
            const DeepCollectionEquality().equals(other.orderList, orderList) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderList),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$OrderListStateCopyWith<_OrderListState> get copyWith =>
      __$OrderListStateCopyWithImpl<_OrderListState>(this, _$identity);
}

abstract class _OrderListState implements OrderListState {
  const factory _OrderListState({List<Order> orderList, bool loading}) =
      _$_OrderListState;

  @override
  List<Order> get orderList;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$OrderListStateCopyWith<_OrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

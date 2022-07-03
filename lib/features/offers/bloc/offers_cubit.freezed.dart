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
      List<QueryDocumentSnapshot<Offer>> offers = const [],
      List<QueryDocumentSnapshot<Offer>> filteredOffers = const [],
      Filters filters = const Filters()}) {
    return _OffersState(
      loading: loading,
      offers: offers,
      filteredOffers: filteredOffers,
      filters: filters,
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
  List<QueryDocumentSnapshot<Offer>> get filteredOffers =>
      throw _privateConstructorUsedError;
  Filters get filters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OffersStateCopyWith<OffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersStateCopyWith<$Res> {
  factory $OffersStateCopyWith(
          OffersState value, $Res Function(OffersState) then) =
      _$OffersStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      List<QueryDocumentSnapshot<Offer>> offers,
      List<QueryDocumentSnapshot<Offer>> filteredOffers,
      Filters filters});

  $FiltersCopyWith<$Res> get filters;
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
    Object? filteredOffers = freezed,
    Object? filters = freezed,
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
      filteredOffers: filteredOffers == freezed
          ? _value.filteredOffers
          : filteredOffers // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get filters {
    return $FiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc
abstract class _$OffersStateCopyWith<$Res>
    implements $OffersStateCopyWith<$Res> {
  factory _$OffersStateCopyWith(
          _OffersState value, $Res Function(_OffersState) then) =
      __$OffersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      List<QueryDocumentSnapshot<Offer>> offers,
      List<QueryDocumentSnapshot<Offer>> filteredOffers,
      Filters filters});

  @override
  $FiltersCopyWith<$Res> get filters;
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
    Object? filteredOffers = freezed,
    Object? filters = freezed,
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
      filteredOffers: filteredOffers == freezed
          ? _value.filteredOffers
          : filteredOffers // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Offer>>,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters,
    ));
  }
}

/// @nodoc

class _$_OffersState implements _OffersState {
  const _$_OffersState(
      {this.loading = true,
      this.offers = const [],
      this.filteredOffers = const [],
      this.filters = const Filters()});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final List<QueryDocumentSnapshot<Offer>> offers;
  @JsonKey()
  @override
  final List<QueryDocumentSnapshot<Offer>> filteredOffers;
  @JsonKey()
  @override
  final Filters filters;

  @override
  String toString() {
    return 'OffersState(loading: $loading, offers: $offers, filteredOffers: $filteredOffers, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OffersState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.offers, offers) &&
            const DeepCollectionEquality()
                .equals(other.filteredOffers, filteredOffers) &&
            const DeepCollectionEquality().equals(other.filters, filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(offers),
      const DeepCollectionEquality().hash(filteredOffers),
      const DeepCollectionEquality().hash(filters));

  @JsonKey(ignore: true)
  @override
  _$OffersStateCopyWith<_OffersState> get copyWith =>
      __$OffersStateCopyWithImpl<_OffersState>(this, _$identity);
}

abstract class _OffersState implements OffersState {
  const factory _OffersState(
      {bool loading,
      List<QueryDocumentSnapshot<Offer>> offers,
      List<QueryDocumentSnapshot<Offer>> filteredOffers,
      Filters filters}) = _$_OffersState;

  @override
  bool get loading;
  @override
  List<QueryDocumentSnapshot<Offer>> get offers;
  @override
  List<QueryDocumentSnapshot<Offer>> get filteredOffers;
  @override
  Filters get filters;
  @override
  @JsonKey(ignore: true)
  _$OffersStateCopyWith<_OffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FiltersTearOff {
  const _$FiltersTearOff();

  _Filters call(
      {List<AnimalType> types = const [
        AnimalType.cats,
        AnimalType.dogs,
        AnimalType.others
      ],
      double range = 100}) {
    return _Filters(
      types: types,
      range: range,
    );
  }
}

/// @nodoc
const $Filters = _$FiltersTearOff();

/// @nodoc
mixin _$Filters {
  List<AnimalType> get types => throw _privateConstructorUsedError;
  double get range => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res>;
  $Res call({List<AnimalType> types, double range});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res> implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  final Filters _value;
  // ignore: unused_field
  final $Res Function(Filters) _then;

  @override
  $Res call({
    Object? types = freezed,
    Object? range = freezed,
  }) {
    return _then(_value.copyWith(
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<AnimalType>,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$FiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$FiltersCopyWith(_Filters value, $Res Function(_Filters) then) =
      __$FiltersCopyWithImpl<$Res>;
  @override
  $Res call({List<AnimalType> types, double range});
}

/// @nodoc
class __$FiltersCopyWithImpl<$Res> extends _$FiltersCopyWithImpl<$Res>
    implements _$FiltersCopyWith<$Res> {
  __$FiltersCopyWithImpl(_Filters _value, $Res Function(_Filters) _then)
      : super(_value, (v) => _then(v as _Filters));

  @override
  _Filters get _value => super._value as _Filters;

  @override
  $Res call({
    Object? types = freezed,
    Object? range = freezed,
  }) {
    return _then(_Filters(
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<AnimalType>,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Filters implements _Filters {
  const _$_Filters(
      {this.types = const [AnimalType.cats, AnimalType.dogs, AnimalType.others],
      this.range = 100});

  @JsonKey()
  @override
  final List<AnimalType> types;
  @JsonKey()
  @override
  final double range;

  @override
  String toString() {
    return 'Filters(types: $types, range: $range)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filters &&
            const DeepCollectionEquality().equals(other.types, types) &&
            const DeepCollectionEquality().equals(other.range, range));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(types),
      const DeepCollectionEquality().hash(range));

  @JsonKey(ignore: true)
  @override
  _$FiltersCopyWith<_Filters> get copyWith =>
      __$FiltersCopyWithImpl<_Filters>(this, _$identity);
}

abstract class _Filters implements Filters {
  const factory _Filters({List<AnimalType> types, double range}) = _$_Filters;

  @override
  List<AnimalType> get types;
  @override
  double get range;
  @override
  @JsonKey(ignore: true)
  _$FiltersCopyWith<_Filters> get copyWith =>
      throw _privateConstructorUsedError;
}

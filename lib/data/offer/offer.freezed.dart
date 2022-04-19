// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
class _$OfferTearOff {
  const _$OfferTearOff();

  _Offer call(
      {required String id,
      required String ownerId,
      required String title,
      required String description,
      required List<AnimalType> animalTypes,
      @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
          required LatLng latLng,
      required List<DateTime> availableDays}) {
    return _Offer(
      id: id,
      ownerId: ownerId,
      title: title,
      description: description,
      animalTypes: animalTypes,
      latLng: latLng,
      availableDays: availableDays,
    );
  }

  Offer fromJson(Map<String, Object?> json) {
    return Offer.fromJson(json);
  }
}

/// @nodoc
const $Offer = _$OfferTearOff();

/// @nodoc
mixin _$Offer {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<AnimalType> get animalTypes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
  LatLng get latLng => throw _privateConstructorUsedError;
  List<DateTime> get availableDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String ownerId,
      String title,
      String description,
      List<AnimalType> animalTypes,
      @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng latLng,
      List<DateTime> availableDays});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res> implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  final Offer _value;
  // ignore: unused_field
  final $Res Function(Offer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? animalTypes = freezed,
    Object? latLng = freezed,
    Object? availableDays = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      animalTypes: animalTypes == freezed
          ? _value.animalTypes
          : animalTypes // ignore: cast_nullable_to_non_nullable
              as List<AnimalType>,
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      availableDays: availableDays == freezed
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
abstract class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) then) =
      __$OfferCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String ownerId,
      String title,
      String description,
      List<AnimalType> animalTypes,
      @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson) LatLng latLng,
      List<DateTime> availableDays});
}

/// @nodoc
class __$OfferCopyWithImpl<$Res> extends _$OfferCopyWithImpl<$Res>
    implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(_Offer _value, $Res Function(_Offer) _then)
      : super(_value, (v) => _then(v as _Offer));

  @override
  _Offer get _value => super._value as _Offer;

  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? animalTypes = freezed,
    Object? latLng = freezed,
    Object? availableDays = freezed,
  }) {
    return _then(_Offer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      animalTypes: animalTypes == freezed
          ? _value.animalTypes
          : animalTypes // ignore: cast_nullable_to_non_nullable
              as List<AnimalType>,
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      availableDays: availableDays == freezed
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Offer extends _Offer {
  const _$_Offer(
      {required this.id,
      required this.ownerId,
      required this.title,
      required this.description,
      required this.animalTypes,
      @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
          required this.latLng,
      required this.availableDays})
      : super._();

  factory _$_Offer.fromJson(Map<String, dynamic> json) =>
      _$$_OfferFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String title;
  @override
  final String description;
  @override
  final List<AnimalType> animalTypes;
  @override
  @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
  final LatLng latLng;
  @override
  final List<DateTime> availableDays;

  @override
  String toString() {
    return 'Offer(id: $id, ownerId: $ownerId, title: $title, description: $description, animalTypes: $animalTypes, latLng: $latLng, availableDays: $availableDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Offer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.ownerId, ownerId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.animalTypes, animalTypes) &&
            const DeepCollectionEquality().equals(other.latLng, latLng) &&
            const DeepCollectionEquality()
                .equals(other.availableDays, availableDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(ownerId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(animalTypes),
      const DeepCollectionEquality().hash(latLng),
      const DeepCollectionEquality().hash(availableDays));

  @JsonKey(ignore: true)
  @override
  _$OfferCopyWith<_Offer> get copyWith =>
      __$OfferCopyWithImpl<_Offer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferToJson(this);
  }
}

abstract class _Offer extends Offer {
  const factory _Offer(
      {required String id,
      required String ownerId,
      required String title,
      required String description,
      required List<AnimalType> animalTypes,
      @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
          required LatLng latLng,
      required List<DateTime> availableDays}) = _$_Offer;
  const _Offer._() : super._();

  factory _Offer.fromJson(Map<String, dynamic> json) = _$_Offer.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get title;
  @override
  String get description;
  @override
  List<AnimalType> get animalTypes;
  @override
  @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
  LatLng get latLng;
  @override
  List<DateTime> get availableDays;
  @override
  @JsonKey(ignore: true)
  _$OfferCopyWith<_Offer> get copyWith => throw _privateConstructorUsedError;
}

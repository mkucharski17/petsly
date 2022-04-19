// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Offer _$$_OfferFromJson(Map<String, dynamic> json) => _$_Offer(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      animalTypes: (json['animalTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$AnimalTypeEnumMap, e))
          .toList(),
      latLng: latLngFromJson(json['latLng'] as Object),
      availableDays: (json['availableDays'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_OfferToJson(_$_Offer instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'title': instance.title,
      'description': instance.description,
      'animalTypes':
          instance.animalTypes.map((e) => _$AnimalTypeEnumMap[e]).toList(),
      'latLng': latLngToJson(instance.latLng),
      'availableDays':
          instance.availableDays.map((e) => e.toIso8601String()).toList(),
    };

const _$AnimalTypeEnumMap = {
  AnimalType.dogs: 'dogs',
  AnimalType.cats: 'cats',
  AnimalType.others: 'others',
};

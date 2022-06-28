// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      favourites: (json['favourites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rates: (json['rates'] as List<dynamic>?)
              ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'description': instance.description,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'favourites': instance.favourites,
      'rates': instance.rates.map((e) => e.toJson()).toList(),
    };

_$_Rate _$$_RateFromJson(Map<String, dynamic> json) => _$_Rate(
      rate: json['rate'] as int,
      textRate: json['textRate'] as String,
    );

Map<String, dynamic> _$$_RateToJson(_$_Rate instance) => <String, dynamic>{
      'rate': instance.rate,
      'textRate': instance.textRate,
    };

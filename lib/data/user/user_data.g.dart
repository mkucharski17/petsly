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
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'description': instance.description,
      'phone': instance.phone,
      'photo': instance.photo,
    };

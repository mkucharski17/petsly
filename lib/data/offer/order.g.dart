// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      offer: Offer.fromJson(json['offer'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      days: (json['days'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'offer': instance.offer.toJson(),
      'status': _$OrderStatusEnumMap[instance.status],
      'days': instance.days.map((e) => e.toIso8601String()).toList(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'requested',
  OrderStatus.rejected: 'rejected',
  OrderStatus.accepted: 'accepted',
};

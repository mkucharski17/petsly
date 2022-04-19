import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/offer/offer.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@JsonEnum()
enum OrderStatus { requested, rejected, accepted }

@freezed
class Order with _$Order {
  const factory Order({
    required String clientId,
    required Offer offer,
    required OrderStatus status,
    required List<DateTime> days,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/offer/offer.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@JsonEnum()
enum OrderStatus { requested, rejected, accepted }

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String clientId,
    required Offer offer,
    required OrderStatus status,
    required List<DateTime> days,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

extension OrderStatusExt on OrderStatus {
  String get text {
    switch (this) {
      case OrderStatus.accepted:
        return 'Potwierdzone';
      case OrderStatus.requested:
        return 'Czeka na potwierdzenie';
      case OrderStatus.rejected:
        return 'Odrzucone';
    }
  }
}

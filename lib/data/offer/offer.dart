import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@JsonEnum()
enum AnimalType { dogs, cats, others }

@freezed
class Offer with _$Offer {
  const Offer._();

  const factory Offer({
    required String id,
    required String ownerId,
    required String title,
    required String description,
    required List<AnimalType> animalTypes,
    @JsonKey(
      fromJson: latLngFromJson,
      toJson: latLngToJson,
    )
        required LatLng latLng,
    required List<DateTime> availableDays,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  ClusterItem<Offer> toCLusterItem() => ClusterItem(latLng, item: this);
}

LatLng latLngFromJson(Object json) => LatLng.fromJson(json)!;

Object latLngToJson(LatLng latLng) => latLng.toJson();

extension AnimalTypeExt on AnimalType {
  String text() {
    switch (this) {
      case AnimalType.dogs:
        return 'Psy';
      case AnimalType.cats:
        return 'Koty';
      case AnimalType.others:
        return 'Inne';
    }
  }
}

extension AnimalTypeListExt on List<AnimalType> {
  String snippet() {
    var string = '';
    for (final type in this) {
      string += ' ✔ ${type.text()}';
    }

    return string;
  }
}

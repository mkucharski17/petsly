import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/location/location_service.dart';

part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({
    required this.firestore,
    required this.locationService,
  }) : super(const OffersState());

  late final StreamSubscription subscription;
  late final StreamSubscription? locationSubscription;

  final LocationService locationService;
  final Firestore firestore;

  LatLng? currentLocation = null;

  void init() {
    subscription = firestore
        .getCollection('offers')
        .withConverter<Offer>(
            fromFirestore: (snapshot, _) => Offer.fromJson(snapshot.data()!),
            toFirestore: (offer, _) => offer.toJson())
        .snapshots()
        .listen(_onMessage);

    locationSubscription = locationService.locations?.listen((event) {
      currentLocation = event;
    });
  }

  void _onMessage(QuerySnapshot<Offer> snapshot) {
    emit(state.copyWith(
      offers: snapshot.docs,
      loading: false,
    ));
    filter(state.filters);
  }

  Future<void> filter(Filters filters) async {
    final offers = [...state.offers];

    final filteredOffers = offers.where((element) {
      bool typeMatch = false;
      bool locationMatch = false;
      for (final type in element.data().animalTypes) {
        if (filters.types.contains(type)) {
          typeMatch = true;
          break;
        }
      }
      final currentLocation = this.currentLocation;

      if (currentLocation != null) {
        final latLng = element.data().latLng;
        final distance = _calculateDistance(currentLocation.latitude,
            currentLocation.longitude, latLng.latitude, latLng.longitude);

        if (distance <= filters.range) {
          locationMatch = true;
        }
      } else {
        locationMatch = true;
      }

      return locationMatch && typeMatch;
    });

    emit(state.copyWith(
      filteredOffers: filteredOffers.toList(),
      filters: filters,
    ));
  }

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}

@freezed
class OffersState with _$OffersState {
  const factory OffersState({
    @Default(true) bool loading,
    @Default([]) List<QueryDocumentSnapshot<Offer>> offers,
    @Default([]) List<QueryDocumentSnapshot<Offer>> filteredOffers,
    @Default(const Filters()) Filters filters,
  }) = _OffersState;
}

@freezed
class Filters with _$Filters {
  const factory Filters({
    @Default([AnimalType.cats, AnimalType.dogs, AnimalType.others])
        List<AnimalType> types,
    @Default(100) double range,
  }) = _Filters;
}

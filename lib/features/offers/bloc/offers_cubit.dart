import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';

part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({required Firestore firestore}) : super(const OffersState()) {
    subscription = firestore
        .getCollection('offers')
        .withConverter<Offer>(
            fromFirestore: (snapshot, _) => Offer.fromJson(snapshot.data()!),
            toFirestore: (offer, _) => offer.toJson())
        .snapshots()
        .listen(_onMessage);
  }

  late final StreamSubscription subscription;

  void _onMessage(QuerySnapshot<Offer> snapshot) {
    emit(state.copyWith(
      offers: snapshot.docs,
      loading: false,
    ));
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
  }) = _OffersState;
}

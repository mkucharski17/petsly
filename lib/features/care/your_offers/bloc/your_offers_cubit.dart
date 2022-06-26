import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';

part 'your_offers_cubit.freezed.dart';

class YourOffersCubit extends Cubit<YourOffersState> {
  YourOffersCubit({
    required this.firestore,
  }) : super(const YourOffersState());

  final Firestore firestore;
  StreamSubscription<QuerySnapshot<Offer>>? subscription;

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    subscription = firestore
        .getCollection('offers')
        .where('ownerId', isEqualTo: currentUserId)
        .withConverter<Offer>(
            fromFirestore: (snapshot, _) => Offer.fromJson(snapshot.data()!),
            toFirestore: (offer, _) => offer.toJson())
        .snapshots()
        .listen((event) {
      emit(state.copyWith(
        yourOfferList: event.docs,
        loading: false,
      ));
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}

@freezed
class YourOffersState with _$YourOffersState {
  const factory YourOffersState({
    @Default(true) bool loading,
    @Default([]) List<QueryDocumentSnapshot<Offer>> yourOfferList,
  }) = _YourOffersState;
}

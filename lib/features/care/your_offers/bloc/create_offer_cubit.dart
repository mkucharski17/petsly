import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:uuid/uuid.dart';

part 'create_offer_cubit.freezed.dart';

class CreateOfferCubit extends Cubit<CreateOfferState> {
  CreateOfferCubit({
    required this.firestore,
    required LatLng latLng,
  }) : super(
          CreateOfferState(
            offer: Offer(
                id: const Uuid().v4(),
                ownerId: FirebaseAuth.instance.currentUser!.uid,
                animalTypes: [],
                latLng: latLng,
                description: '',
                title: '',
                availableDays: []),
          ),
        );

  final Firestore firestore;

  void updateTitle(String value) {
    final newOffer = state.offer.copyWith(title: value);

    emit(
      state.copyWith(offer: newOffer),
    );
  }

  void updateDescription(String value) {
    final newOffer = state.offer.copyWith(description: value);

    emit(
      state.copyWith(offer: newOffer),
    );
  }

  void toggleType(AnimalType value) {
    final types = state.offer.animalTypes;

    if (types.contains(value)) {
      types.remove(value);
    } else {
      types.add(value);
    }
    final newOffer = state.offer.copyWith(animalTypes: [...types]);

    emit(
      state.copyWith(offer: newOffer),
    );
  }

  void updateDays(List<DateTime> days) {
    final newOffer = state.offer.copyWith(availableDays: [...days]);

    emit(
      state.copyWith(offer: newOffer),
    );
  }

  void save() {
    firestore.addDocument(
      collectionPath: 'offers',
      data: state.offer.toJson(),
    );
  }
}

@freezed
class CreateOfferState with _$CreateOfferState {
  const factory CreateOfferState({required Offer offer}) = _CreateOfferState;
}

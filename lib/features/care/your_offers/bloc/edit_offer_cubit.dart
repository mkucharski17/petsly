import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';

part 'edit_offer_cubit.freezed.dart';

class EditOfferCubit extends Cubit<EditOfferState> {
  EditOfferCubit({
    required this.originalOffer,
    required this.firestore,
  }) : super(
          EditOfferState(
            offer: originalOffer.data(),
            changed: false,
          ),
        ) {
    print(state);
  }

  final QueryDocumentSnapshot<Offer> originalOffer;
  final Firestore firestore;

  void updateTitle(String value) {
    final newOffer = state.offer.copyWith(title: value);

    emit(
      state.copyWith(
        offer: newOffer,
        changed: newOffer != originalOffer,
      ),
    );
  }

  void updateDescription(String value) {
    final newOffer = state.offer.copyWith(description: value);

    emit(
      state.copyWith(
        offer: newOffer,
        changed: newOffer != originalOffer,
      ),
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
      state.copyWith(
        offer: newOffer,
        changed: newOffer != originalOffer,
      ),
    );
  }

  void updateDays(List<DateTime> days) {
    final newOffer = state.offer.copyWith(availableDays: [...days]);

    emit(
      state.copyWith(
        offer: newOffer,
        changed: newOffer != originalOffer,
      ),
    );
  }

  void save() {
    firestore.updateDocument(
      collectionPath: 'offers',
      docId: originalOffer.reference.id,
      data: state.offer.toJson(),
    );
  }
}

@freezed
class EditOfferState with _$EditOfferState {
  const factory EditOfferState({
    required Offer offer,
    required bool changed,
  }) = _EditOfferState;
}

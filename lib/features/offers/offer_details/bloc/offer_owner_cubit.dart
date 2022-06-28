import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/user/user_data.dart';

class OfferOwnerCubit extends Cubit<UserData?> {
  OfferOwnerCubit({
    required this.firestore,
    required this.ownerId,
  }) : super(null);

  final String ownerId;

  final Firestore firestore;
  StreamSubscription? subscription;

  void init() {
    subscription = firestore
        .getCollection('users')
        .withConverter<UserData>(
            fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson())
        .snapshots()
        .listen(_onMessage);
  }

  Future<void> rate(int rate, String rateText) async {
    final doc = await firestore.getDocument(
      collectionPath: 'users',
      snapshotQuery: (snapshot) {
        return snapshot.mappedData['id'] == ownerId;
      },
    );

    final data = UserData.fromJson(doc!.mappedData);

    final rates = [...data.rates];

    rates.add(Rate(rate: rate, textRate: rateText));

    firestore.updateDocument(
      collectionPath: 'users',
      docId: doc.id,
      data: data.copyWith(rates: rates).toJson(),
    );
  }

  void _onMessage(QuerySnapshot<UserData> snapshot) {
    final ownerData =
        snapshot.docs.firstWhere((element) => element.data().id == ownerId);

    emit(ownerData.data());
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}

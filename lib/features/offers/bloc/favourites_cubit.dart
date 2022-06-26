import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/user/user_data.dart';

class FavouritesCubit extends Cubit<List<String>> {
  FavouritesCubit({required this.firestore}) : super(const []) {}

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

  Future<void> toggle(String id) async {
    final doc = await firestore.getDocument(
      collectionPath: 'users',
      snapshotQuery: (snapshot) {
        return snapshot.mappedData['id'] ==
            FirebaseAuth.instance.currentUser!.uid;
      },
    );

    final data = UserData.fromJson(doc!.mappedData);
    final favourites = data.favourites;

    if (favourites.contains(id)) {
      favourites.remove(id);
    } else {
      favourites.add(id);
    }

    firestore.updateDocument(
      collectionPath: 'users',
      docId: doc.id,
      data: data.copyWith(favourites: favourites).toJson(),
    );
  }

  void _onMessage(QuerySnapshot<UserData> snapshot) {
    final favourites = snapshot.docs
        .firstWhere((element) =>
            element.data().id == FirebaseAuth.instance.currentUser!.uid)
        .data()
        .favourites;

    emit(favourites);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}

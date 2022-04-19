import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/data/offer/order.dart';
import 'package:petsly/utils/date_time_extension.dart';
import 'package:uuid/uuid.dart';

class OfferRequestCubit extends Cubit<List<DateTime>> {
  OfferRequestCubit({required this.firestore}) : super([]);

  final Firestore firestore;

  void toggleDay(DateTime day) {
    final newState = state;
    if (state.containsDay(day)) {
      newState.remove(day);
    } else {
      newState.add(day);
    }

    emit([...newState]);
  }

  Future<void> makeRequest(String clientId, Offer offer) async {
    final id = const Uuid().v4();

    firestore
        .addDocument(
      collectionPath: 'orders',
      data: Order(
        id: id,
        clientId: clientId,
        offer: offer,
        days: state,
        status: OrderStatus.requested,
      ).toJson(),
    )
        .then((value) {
      Fluttertoast.showToast(
        msg: 'Prośba o opiekę wysłana :)',
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );
      emit([]);
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak, spróbuj ponownie.',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    });
  }
}

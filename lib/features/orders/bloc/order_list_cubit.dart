import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/order.dart';

class OrderListCubit extends Cubit<List<Order>> {
  OrderListCubit({required this.firestore}) : super([]);

  final Firestore firestore;

  Future<void> init() async {
    final snapshot = await firestore.getCollection('orders').get();

    final orders = snapshot.docs
        .map((e) => Order.fromJson(e.mappedData))
        .where(
          (e) => e.offer.ownerId == FirebaseAuth.instance.currentUser!.uid,
        )
        .toList();
  }

  Future<void> updateStatus(Order order, OrderStatus status) async {
    final orders = state;
    final indexToChange =
        orders.indexWhere((element) => element.id == order.id);

    final docs = await firestore.getCollection('orders').get();
    orders[indexToChange] = order.copyWith(status: status);

    final docToUpdate = docs.docs
        .firstWhereOrNull((element) => element.mappedData['id'] == order.id);

    if (docToUpdate != null) {
      firestore
          .updateDocument(
        collectionPath: 'orders',
        docId: docToUpdate.id,
        data: order.toJson(),
      )
          .then((value) {
        emit([...orders]);

        Fluttertoast.showToast(
          msg: 'Status zaktualizowany',
          backgroundColor: Colors.blue,
          textColor: Colors.white,
        );
      }).catchError((error) {
        Fluttertoast.showToast(
          msg: 'Coś poszło nie tak, spróbuj ponownie.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/order.dart';

part 'order_list_cubit.freezed.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit({
    required this.firestore,
    required this.yours,
  }) : super(const OrderListState());

  final bool yours;
  final Firestore firestore;
  StreamSubscription? subscription;

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    subscription = firestore
        .getCollection('orders')
        .withConverter<Order>(
            fromFirestore: (snapshot, _) => Order.fromJson(snapshot.data()!),
            toFirestore: (order, _) => order.toJson())
        .snapshots()
        .listen(_onMessage);
  }

  void _onMessage(QuerySnapshot<Order> snapshot) {
    final orders = snapshot.docs
        .map((e) => e.data())
        .where(
          (e) =>
              (yours ? e.clientId : e.offer.ownerId) ==
              FirebaseAuth.instance.currentUser!.uid,
        )
        .toList();
    emit(state.copyWith(orderList: orders, loading: false));
  }

  Future<void> updateStatus(Order order, OrderStatus status) async {
    final orders = state.orderList;
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
        docId: docToUpdate.reference.id,
        data: orders[indexToChange].toJson(),
      )
          .then((value) {
        emit(state.copyWith(orderList: [...orders]));

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

@freezed
class OrderListState with _$OrderListState {
  const factory OrderListState({
    @Default([]) List<Order> orderList,
    @Default(false) bool loading,
  }) = _OrderListState;
}

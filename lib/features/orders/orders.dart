import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/order.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: context.read<Firestore>().getCollection('orders').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final orders =
            snapshot.data!.docs.map((e) => Order.fromJson(e.mappedData)).where(
                  (e) =>
                      e.offer.ownerId == FirebaseAuth.instance.currentUser!.uid,
                );

        return ListView(
          shrinkWrap: true,
          children: orders.map((e) => Text(e.status.toString())).toList(),
        );
      },
    );
  }
}

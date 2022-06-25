import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:petsly/features/offers/offers_map.dart';

class OfferListBuilder extends StatelessWidget {
  const OfferListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(OffersMapScreenRoute());
        },
        child: const Icon(
          Icons.map,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<OffersCubit, OffersState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return _OfferList(offers: state.offers);
        },
      ),
    );
  }
}

class _OfferList extends StatelessWidget {
  const _OfferList({
    Key? key,
    required this.offers,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Offer>> offers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Text(
        offers[index].data().toJson().toString(),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: offers.length,
    );
  }
}

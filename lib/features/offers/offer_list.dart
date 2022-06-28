import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/offers/bloc/favourites_cubit.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:petsly/features/offers/offer_details/offer_details_screen.dart';
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
    return BlocBuilder<FavouritesCubit, List<String>>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          itemBuilder: (context, index) {
            final data = offers[index].data();
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(OfferDetailsScreenRoute(offer: data));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.read<FavouritesCubit>().toggle(data.id),
                          child: state.contains(data.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_outline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.description,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: offers.length,
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/offers/bloc/favourites_cubit.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:petsly/features/offers/offer_details/offer_details_screen.dart';

class FavouritesPage extends Page<void> {
  const FavouritesPage({LocalKey? key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) =>
      FavouritesScreenRoute(page: this);
}

class FavouritesScreenRoute extends MaterialPageRoute<void> {
  FavouritesScreenRoute({FavouritesPage? page})
      : super(
          settings: page,
          builder: (context) => BlocBuilder<FavouritesCubit, List<String>>(
            builder: (context, favourites) {
              return BlocBuilder<OffersCubit, OffersState>(
                builder: (context, state) {
                  final favouriteOffers = state.offers
                      .where(
                          (element) => favourites.contains(element.data().id))
                      .toList();
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return FavouritesList(
                    offers: favouriteOffers,
                  );
                },
              );
            },
          ),
        );
}

class FavouritesList extends StatelessWidget {
  const FavouritesList({
    Key? key,
    required this.offers,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Offer>> offers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulubione'),
      ),
      body: offers.isEmpty
          ? const Center(
              child: Text('Nie masz jeszcze żadnej ulubionej oferty'),
            )
          : ListView.separated(
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
                              onTap: () => context
                                  .read<FavouritesCubit>()
                                  .toggle(data.id),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
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
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: offers.length,
            ),
    );
  }
}

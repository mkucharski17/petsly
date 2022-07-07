import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/features/care/your_offers/add_offer_bottom_sheet.dart';
import 'package:petsly/features/care/your_offers/bloc/your_offers_cubit.dart';
import 'package:petsly/features/care/your_offers/editable_offer_page.dart';
import 'package:petsly/features/care/your_offers/offer_orders_page.dart';

class YourOffers extends StatelessWidget {
  const YourOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourOffersCubit(
        firestore: context.read(),
      )..init(),
      child: Builder(builder: (context) {
        return BlocBuilder<YourOffersCubit, YourOffersState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.yourOfferList.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Nie masz jeszcze ofert'),
                  const SizedBox(height: 16),
                  IconButton(
                    iconSize: 36,
                    onPressed: () => AddOfferBottomSheet.show(context),
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                ],
              );
            }

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () => AddOfferBottomSheet.show(context),
                child: const Icon(
                  Icons.add,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              body: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final data = state.yourOfferList[index].data();

                  return GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                        EditableOfferScreenRoute(
                          doc: state.yourOfferList[index],
                        ),
                      );
                      context.read<YourOffersCubit>().init();
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
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data.description,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                OfferOrdersScreenRoute(offer: data),
                              );
                            },
                            child: const Text(
                              'Pokaż zamówiena',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: state.yourOfferList.length,
              ),
            );
          },
        );
      }),
    );
  }
}

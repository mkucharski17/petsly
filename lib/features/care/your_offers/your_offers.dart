import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsly/features/care/your_offers/bloc/your_offers_cubit.dart';
import 'package:petsly/features/care/your_offers/editable_offer_page.dart';

class YourOffers extends StatelessWidget {
  const YourOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourOffersCubit(
        firestore: context.read(),
      )..fetch(),
      child: Builder(builder: (context) {
        return BlocBuilder<YourOffersCubit, YourOffersState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
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
                    context.read<YourOffersCubit>().fetch();
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
                            Text(
                              'id: ${data.id}',
                              style: const TextStyle(
                                fontSize: 14,
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
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: state.yourOfferList.length,
            );
          },
        );
      }),
    );
  }
}

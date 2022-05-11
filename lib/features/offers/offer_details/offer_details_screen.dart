import 'package:build_context/build_context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/data/chat/conversation.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/data/user/user_data.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/chat/conversation_details_page.dart';
import 'package:petsly/features/offers/offer_details/bloc/offer_request_cubit.dart';
import 'package:petsly/features/offers/offer_details/confirm_request_dialog.dart';
import 'package:petsly/utils/date_time_extension.dart';
import 'package:petsly/utils/ui/divider.dart';
import 'package:petsly/utils/ui/utils/widget_extension.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailsPage extends Page<void> {
  const OfferDetailsPage({
    required this.offer,
    LocalKey? key,
  }) : super(key: key);

  final Offer offer;

  @override
  Route<void> createRoute(BuildContext context) =>
      OfferDetailsScreenRoute(offer: offer, page: this);
}

class OfferDetailsScreenRoute extends MaterialPageRoute<void> {
  OfferDetailsScreenRoute({required Offer offer, OfferDetailsPage? page})
      : super(
          settings: page,
          builder: (context) => BlocProvider<OfferRequestCubit>(
            create: (context) => OfferRequestCubit(firestore: context.read()),
            child: OfferDetailsScreen(offer: offer),
          ),
        );
}

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<QueryDocumentSnapshot?>(
            future: context.read<Firestore>().getDocument(
                collectionPath: 'users',
                snapshotQuery: (snapshot) {
                  return snapshot.mappedData['id'] == offer.ownerId;
                }),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: const CircularProgressIndicator(),
                );
              }
              final offerOwner = UserData.fromJson(snapshot.data!.mappedData);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offer.title,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              offerOwner.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 12),
                            _OwnerPhoto(photoUrl: offerOwner.photoUrl)
                          ],
                        ),
                      ],
                    ),
                    if (offerOwner.description != null)
                      Text(
                        offerOwner.description!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text('Telefon: ${offerOwner.phone}'),
                        const SizedBox(width: 16),
                        IconButton(
                          iconSize: 20,
                          onPressed: () {
                            launch('tel:+48 ${offerOwner.phone}');
                          },
                          icon: const Icon(
                            Icons.call,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('E-mail: ${offerOwner.email}'),
                        const SizedBox(width: 16),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            launch('mailto:${offerOwner.email}');
                          },
                          iconSize: 20,
                          icon: const Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Napisz na czacie'),
                        const SizedBox(width: 16),
                        IconButton(
                          iconSize: 20,
                          onPressed: () async {
                            final currentUserData = await context
                                .read<Firestore>()
                                .getDocument(
                                  collectionPath: 'users',
                                  snapshotQuery: (snapshot) {
                                    return snapshot.mappedData['id'] ==
                                        context.read<AuthStateCubit>().userId;
                                  },
                                );
                            final user = UserData.fromJson(currentUserData!
                                .data() as Map<String, dynamic>);

                            Navigator.of(context).push(
                              ConversationDetailsScreenRoute(
                                currentUser: ConversationParticipant(
                                  id: user.id,
                                  name: user.name,
                                  photoUrl: user.photoUrl,
                                ),
                                otherUser: ConversationParticipant(
                                  id: offerOwner.id,
                                  name: offerOwner.name,
                                  photoUrl: offerOwner.photoUrl,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.message,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: PetslyDivider(),
                    ),
                    const Text(
                      'Szczegóły',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      offer.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        for (final animalType in AnimalType.values)
                          Expanded(
                            child: _AnimalType(
                              animalType: animalType,
                              available: offer.animalTypes.contains(animalType),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const PetslyDivider(),
                    _Calendar(offer: offer),
                  ],
                ).columnPadded24,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Calendar extends HookWidget {
  _Calendar({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    final format = useState(CalendarFormat.month);
    final selectedDays = context.watch<OfferRequestCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Wybierz dni',
              style: TextStyle(fontSize: 20),
            ),
            Opacity(
              opacity: selectedDays.isNotEmpty ? 1 : 0.25,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: selectedDays.isNotEmpty
                    ? () async {
                        final confirmed =
                            await ConfirmRequestDialog.show(context);

                        if (confirmed ?? false) {
                          context.read<OfferRequestCubit>().makeRequest(
                                FirebaseAuth.instance.currentUser!.uid,
                                offer,
                              );
                          context.pop();
                        }
                      }
                    : null,
                child: Container(
                  width: 100,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: const Text('Potwierdź'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TableCalendar(
            headerStyle: HeaderStyle(
              titleTextStyle:
                  const TextStyle(fontSize: 17, color: Colors.white),
              formatButtonTextStyle:
                  const TextStyle(fontSize: 14, color: Colors.white),
              formatButtonDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            locale: 'pl_PL',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            enabledDayPredicate: (dateTime) {
              final today = DateTime.now();
              return dateTime.isAfter(today) &&
                  offer.availableDays.containsDay(dateTime);
            },
            calendarFormat: format.value,
            onFormatChanged: (calendarFormat) => format.value = calendarFormat,
            selectedDayPredicate: (dateTime) {
              return selectedDays.containsDay(dateTime);
            },
            onDaySelected: (selectedDay, _) {
              context.read<OfferRequestCubit>().toggleDay(selectedDay);
            },
            availableCalendarFormats: {
              CalendarFormat.month: 'miesiąc',
              CalendarFormat.twoWeeks: 'dwa tygodnie',
              CalendarFormat.week: 'tydzień'
            },
          ),
        ),
      ],
    );
  }
}

class _AnimalType extends StatelessWidget {
  const _AnimalType({
    Key? key,
    required this.animalType,
    required this.available,
  }) : super(key: key);

  final AnimalType animalType;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (available)
            const Icon(
              Icons.check,
              color: Colors.green,
            )
          else
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          const SizedBox(
            width: 6,
          ),
          Text(animalType.text()),
        ],
      ),
    );
  }
}

class _OwnerPhoto extends StatelessWidget {
  const _OwnerPhoto({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl;

    if (photoUrl == null) {
      return const Icon(
        Icons.account_circle,
        color: Colors.grey,
        size: 64,
      );
    }
    return ClipOval(
      child: CachedNetworkImage(
        width: 76,
        height: 76,
        imageUrl: photoUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

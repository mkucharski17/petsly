import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/care/your_offers/bloc/create_offer_cubit.dart';
import 'package:petsly/utils/date_time_extension.dart';
import 'package:petsly/utils/ui/utils/widget_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateOfferPage extends Page<void> {
  const CreateOfferPage({
    required this.latLng,
    LocalKey? key,
  }) : super(key: key);

  final LatLng latLng;

  @override
  Route<void> createRoute(BuildContext context) =>
      CreateOfferScreenRoute(latLng: latLng, page: this);
}

class CreateOfferScreenRoute extends MaterialPageRoute<void> {
  CreateOfferScreenRoute({
    required LatLng latLng,
    CreateOfferPage? page,
  }) : super(
          settings: page,
          builder: (context) => BlocProvider(
            create: (context) => CreateOfferCubit(
              firestore: context.read(),
              latLng: latLng,
            ),
            child: OfferDetailsScreen(latLng: latLng),
          ),
        );
}

class OfferDetailsScreen extends HookWidget {
  const OfferDetailsScreen({
    Key? key,
    required this.latLng,
  }) : super(key: key);

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return BlocBuilder<CreateOfferCubit, CreateOfferState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nowa oferta'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration:
                                const InputDecoration(hintText: 'Nazwa oferty'),
                            controller: titleController,
                            style: const TextStyle(fontSize: 16),
                            onChanged: (title) {
                              context
                                  .read<CreateOfferCubit>()
                                  .updateTitle(title);
                            },
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            context.read<CreateOfferCubit>().save();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 100,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: const Text('Zapisz'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    TextField(
                      decoration:
                          const InputDecoration(hintText: 'Opis oferty'),
                      controller: descriptionController,
                      style: const TextStyle(fontSize: 16),
                      onChanged: (description) {
                        context
                            .read<CreateOfferCubit>()
                            .updateDescription(description);
                      },
                      maxLines: null,
                    ),
                    Row(
                      children: [
                        for (final animalType in AnimalType.values)
                          Expanded(
                            child: AnimalTypeCheckbox(animalType: animalType),
                          )
                      ],
                    ),
                    const SizedBox(height: 24),
                    _Calendar(offer: state.offer),
                  ],
                ).columnPadded24,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Calendar extends HookWidget {
  const _Calendar({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    final format = useState(CalendarFormat.month);
    final selectedDays = useState(offer.availableDays);

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
            calendarStyle: const CalendarStyle(
              todayDecoration: const BoxDecoration(),
              todayTextStyle: TextStyle(color: Colors.black),
            ),
            enabledDayPredicate: (dateTime) => true,
            calendarFormat: format.value,
            onFormatChanged: (calendarFormat) => format.value = calendarFormat,
            selectedDayPredicate: (dateTime) {
              return selectedDays.value.containsDay(dateTime);
            },
            onDaySelected: (selectedDay, _) {
              final days = selectedDays.value;

              if (days.contains(selectedDay)) {
                days.remove(selectedDay);
              } else {
                days.add(selectedDay);
              }

              selectedDays.value = [...days];
              context.read<CreateOfferCubit>().updateDays(days);
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

class AnimalTypeCheckbox extends HookWidget {
  const AnimalTypeCheckbox({
    Key? key,
    required this.animalType,
  }) : super(key: key);

  final AnimalType animalType;

  @override
  Widget build(BuildContext context) {
    final types = context.watch<CreateOfferCubit>().state.offer.animalTypes;
    final isTrue = useState(types.contains(animalType));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: isTrue.value,
            onChanged: (value) {
              isTrue.value = value ?? true;
              context.read<CreateOfferCubit>().toggleType(animalType);
            },
          ),
          const SizedBox(width: 6),
          Text(animalType.text()),
        ],
      ),
    );
  }
}

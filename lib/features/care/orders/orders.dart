import 'package:build_context/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/data/offer/order.dart';
import 'package:petsly/data/user/user_data.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:petsly/features/care/orders/bloc/order_list_cubit.dart';
import 'package:petsly/features/chat/conversation_details_page.dart';
import 'package:petsly/features/offers/offer_details/offer_details_screen.dart';
import 'package:petsly/utils/date_time_extension.dart';
import 'package:petsly/utils/hook/use_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class Orders extends HookWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit(
      () => OrderListCubit(
        firestore: context.read(),
        yours: true,
      )..init(),
    );

    return BlocBuilder<OrderListCubit, OrderListState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.orderList.isEmpty) {
          return const Center(
            child: Text('Nie masz jeszcze zamówień'),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.orderList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final order = state.orderList.elementAt(index);

              return AnimatedContainer(
                duration: const Duration(seconds: 300),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.offer.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('Status: '),
                                  Text(
                                    order.status.text,
                                    style: TextStyle(
                                      color: getStatusColor(order.status),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.push(
                                        OfferDetailsScreenRoute(
                                          offer: order.offer,
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Zobacz oferte',
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  const Text(' lub '),
                                  InkWell(
                                    onTap: () async {
                                      final currentUserData = await context
                                          .read<Firestore>()
                                          .getDocument(
                                            collectionPath: 'users',
                                            snapshotQuery: (snapshot) {
                                              return snapshot
                                                      .mappedData['id'] ==
                                                  context
                                                      .read<AuthStateCubit>()
                                                      .userId;
                                            },
                                          );
                                      final user = UserData.fromJson(
                                          currentUserData!.data()
                                              as Map<String, dynamic>);

                                      final otherUserData = await context
                                          .read<Firestore>()
                                          .getDocument(
                                            collectionPath: 'users',
                                            snapshotQuery: (snapshot) {
                                              return snapshot
                                                      .mappedData['id'] ==
                                                  order.clientId;
                                            },
                                          );
                                      final otherUser = UserData.fromJson(
                                          otherUserData!.data()
                                              as Map<String, dynamic>);

                                      Navigator.of(context).push(
                                        ConversationDetailsScreenRoute(
                                          currentUserId: user.id,
                                          otherUser: otherUser,
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Napisz na czacie',
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _Calendar(selectedDays: order.days),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return Colors.green;
      case OrderStatus.requested:
        return Colors.black;
      case OrderStatus.rejected:
        return Colors.red;
    }
  }
}

class _Calendar extends HookWidget {
  const _Calendar({
    Key? key,
    required this.selectedDays,
  }) : super(key: key);

  final List<DateTime> selectedDays;

  @override
  Widget build(BuildContext context) {
    final format = useState(CalendarFormat.month);

    return TableCalendar(
      headerStyle: HeaderStyle(
        titleTextStyle: const TextStyle(fontSize: 17, color: Colors.white),
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
      calendarFormat: format.value,
      onFormatChanged: (calendarFormat) => format.value = calendarFormat,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (dateTime) {
        return selectedDays.containsDay(dateTime);
      },
      enabledDayPredicate: (dateTime) {
        return selectedDays.containsDay(dateTime);
      },
      availableCalendarFormats: {
        CalendarFormat.month: 'miesiąc',
        CalendarFormat.twoWeeks: 'dwa tygodnie',
        CalendarFormat.week: 'tydzień'
      },
    );
  }
}

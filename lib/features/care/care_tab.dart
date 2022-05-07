import 'package:flutter/material.dart';
import 'package:petsly/features/care/orders/orders.dart';
import 'package:petsly/features/care/your_offers/your_offers.dart';

class CareTab extends StatefulWidget {
  const CareTab({Key? key}) : super(key: key);

  @override
  State<CareTab> createState() => _CareTabState();
}

class _CareTabState extends State<CareTab> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
            enableFeedback: false,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
            ),
            unselectedLabelColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tabs: [
              const Text(
                'Twoje zamówienia',
                style: TextStyle(color: Colors.black),
              ),
              const Text(
                'Twoje oferty',
                style: const TextStyle(color: Colors.black),
              ),
            ],
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const Orders(),
              const YourOffers(),
            ],
          ),
        ),
      ],
    );
  }
}

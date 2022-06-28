import 'package:flutter/material.dart';
import 'package:petsly/data/user/user_data.dart';

class RatesPage extends Page<void> {
  const RatesPage({
    required this.rates,
    LocalKey? key,
  }) : super(key: key);

  final List<Rate> rates;

  @override
  Route<void> createRoute(BuildContext context) =>
      RatesScreenRoute(rates: rates, page: this);
}

class RatesScreenRoute extends MaterialPageRoute<void> {
  RatesScreenRoute({required List<Rate> rates, RatesPage? page})
      : super(
          settings: page,
          builder: (context) => RatesScreen(rates: rates),
        );
}

class RatesScreen extends StatelessWidget {
  const RatesScreen({
    Key? key,
    required this.rates,
  }) : super(key: key);

  final List<Rate> rates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wszystkie oceny')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        itemBuilder: (context, index) {
          final rate = rates.reversed.elementAt(index);

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _Stars(rate: rate.rate),
                if (rate.textRate.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(rate.textRate),
                      )),
                    ],
                  ),
                ]
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
        itemCount: rates.length,
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          Padding(
            padding: const EdgeInsets.all(6),
            child: rate >= i
                ? const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.star_outline,
                    color: Colors.black,
                  ),
          )
      ],
    );
  }
}

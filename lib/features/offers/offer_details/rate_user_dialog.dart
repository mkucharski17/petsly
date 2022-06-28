import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/data/user/user_data.dart';

class RateUserDialog extends HookWidget {
  const RateUserDialog({
    Key? key,
    required this.onRate,
  }) : super(key: key);

  final Function(Rate) onRate;

  @override
  Widget build(BuildContext context) {
    final newRate = useState(0);
    final newRateText = useState('initialData');

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Oceń użytkownika',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _Stars(
              rate: newRate.value,
              onChange: (value) => newRate.value = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Dodaj cos od siebie'),
              initialValue: '',
              onChanged: (text) => newRateText.value = text,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Anuluj'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Opacity(
                      opacity: newRate.value == 0 ? 0.5 : 1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                        ),
                        onPressed: newRate != 0
                            ? () {
                                onRate(
                                  Rate(
                                    rate: newRate.value,
                                    textRate: newRateText.value,
                                  ),
                                );
                                Navigator.of(context).pop();
                              }
                            : null,
                        child: const Text(
                          'Zatwierdź',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool?> show(
    BuildContext context, {
    required Function(Rate) onRate,
  }) =>
      showDialog<bool>(
        context: context,
        builder: (context) => RateUserDialog(onRate: onRate),
      );
}

class _Stars extends StatelessWidget {
  const _Stars({
    Key? key,
    required this.rate,
    required this.onChange,
  }) : super(key: key);

  final int rate;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () => onChange(i),
            child: Padding(
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
            ),
          )
      ],
    );
  }
}

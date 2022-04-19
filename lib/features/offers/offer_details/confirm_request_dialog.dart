import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfirmRequestDialog extends HookWidget {
  const ConfirmRequestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Potwierdzenie oferty zarezerwuje dni dla Ciebie. '
              'Skontaktuj się z właścicielem oferty w sprawie dogadania szczegółów.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Anuluj'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        'Zatwierdź',
                        style: TextStyle(color: Colors.blue),
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

  static Future<bool?> show(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (context) => const ConfirmRequestDialog(),
      );
}

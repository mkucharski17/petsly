import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:petsly/ui/ui.dart';

typedef Validator = String? Function(String?);

class ChangeDataDialog extends HookWidget {
  const ChangeDataDialog({
    Key? key,
    required this.initialText,
    required this.validator,
    this.maxLines = 1,
  }) : super(key: key);

  final String initialText;
  final Validator validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialText);

    final error = useState<String?>(null);
    useEffect(() {
      void listener() {
        error.value = validator(controller.text);
      }

      controller.addListener(listener);

      return () => controller.removeListener(listener);
    }, []);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              maxLines: maxLines,
            ).columnPadded24,
            const SizedBox(height: 12),
            Text(
              error.value ?? '',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12),
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
                    child: ElevatedButton(
                      onPressed: error.value == null
                          ? () => Navigator.of(context).pop(controller.text)
                          : null,
                      child: const Text('Zapisz'),
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

  static Future<String?> show(
    BuildContext context, {
    required String initialText,
    required Validator validator,
    required int? maxLines,
  }) =>
      showDialog<String>(
        context: context,
        builder: (context) => ChangeDataDialog(
          initialText: initialText,
          validator: validator,
          maxLines: maxLines,
        ),
      );
}

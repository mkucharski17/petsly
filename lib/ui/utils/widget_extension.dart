import 'package:flutter/cupertino.dart';

extension WidgetExt on Widget {
  Widget get columnPadded24 => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: this,
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PetslyDivider extends StatelessWidget {
  const PetslyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: 1,
      color: Colors.black.withOpacity(0.1),
    );
  }
}

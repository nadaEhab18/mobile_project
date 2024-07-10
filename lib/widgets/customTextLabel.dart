
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String textLabel;
  const TextLabel({
    Key? key,
    required this.textLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textLabel,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

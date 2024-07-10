
import 'package:flutter/material.dart';

class TextTabBar extends StatelessWidget {
  final String text ;
  const TextTabBar({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none, // Remove underline
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ColumnTable extends StatelessWidget {
  final String columnName ;
  final double fontSize;
  const ColumnTable({
    Key? key, required this.columnName, required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(columnName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.brown.shade600,
            decoration: TextDecoration.none, // Remove underline
          ),
        ),
      ],
    );
  }
}
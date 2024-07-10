
import 'package:flutter/material.dart';

class CustomQuestion extends StatelessWidget {
  final String question;
  final String answer;
  const CustomQuestion({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          border: Border.all(
            color: Color(0xffac8600),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.symmetric(horizontal: 50),
        collapsedTextColor: Colors.black,
        backgroundColor: Colors.blueGrey.shade100,
        title: Text(
          question,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        expandedAlignment: Alignment.topRight,
        children: [
          Text(
            answer,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

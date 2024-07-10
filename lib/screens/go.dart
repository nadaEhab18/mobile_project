import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Go extends StatelessWidget {
  const Go({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("text"),),
      body: Container(color: Colors.red,),
    ) ; }
}

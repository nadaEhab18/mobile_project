import 'package:flutter/material.dart';

typedef Onchanged = void Function(bool)? ;
class CustomSwitch extends StatelessWidget {
  final String switchTitle;
  final bool switchValue ;
  final Onchanged changeFunction ;
  const CustomSwitch({Key? key, required this.switchTitle,
    required this.changeFunction, required this.switchValue, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SwitchListTile(
        activeColor: Color(0xff093c71),
        title: Text(switchTitle,),
        value: switchValue,
        onChanged: changeFunction,
      ),
    );
  }
}
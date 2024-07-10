import 'package:flutter/material.dart';

typedef Validation = String? Function(String?)?;
typedef ShowBirthday = Function()?;
typedef OnEditingComplete = void Function()?;

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Validation validator;
  final ShowBirthday birthday;
  final OnEditingComplete showInput;
  final TextInputType? typeKeyBoard;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final Function(String?)? onChanged;
  final String? initialValue; // Add this line

  const CustomTextFormField({
    Key? key,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.typeKeyBoard,
    this.obscureText = false,
    this.suffixIcon,
    this.birthday,
    this.showInput,
    required this.label,
    this.initialValue, // Add this line
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the initial value of the controller
    if (initialValue != null) {
      controller.text = initialValue!;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          textDirection: TextDirection.rtl,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(),
            labelText: label,
          ),
          keyboardType: typeKeyBoard,
          validator: validator,
          obscureText: obscureText,
          onTap: birthday,
          onChanged: onChanged,
          onEditingComplete: showInput,
        ),
      ),
    );
  }
}

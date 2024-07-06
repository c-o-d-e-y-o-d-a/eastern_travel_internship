import 'package:flutter/material.dart';

class TextInputFieldNum extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;

  const TextInputFieldNum({
    super.key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      keyboardType: TextInputType.number, 
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey),
          )),
      obscureText: isObscure,
    );
  }
}

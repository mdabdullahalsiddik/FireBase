import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomTextField extends StatelessWidget {
  String? hintText;
  String? labelText;
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  // ignore: prefer_typing_uninitialized_variables
  var icon;

  CostomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.green),
          labelText: labelText,
          prefixIcon: icon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
      ),
    );
  }
}

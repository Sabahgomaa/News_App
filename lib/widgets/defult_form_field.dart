import 'dart:core';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefultFormField extends StatelessWidget {
  Color background = Colors.blue;
  TextEditingController controller;
  TextInputType type;
  Function(String value)? onChange;
  String? Function(String value) validate;
  String label;
  IconData prefix;

  DefultFormField({
    required this.controller,
    required this.type,
    required this.onChange,
    required this.validate,
    required this.label,
    required this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        child: MaterialButton(
          color: background,
          onPressed: () {
            // ignore: unnecessary_statements
            onChange;
          },
        ));
  }
}

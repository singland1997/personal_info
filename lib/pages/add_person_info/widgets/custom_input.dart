import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    this.onChanged,
    this.hint,
    this.inputBorder,
    this.controller,
  });

  final ValueChanged<String>? onChanged;
  final String? hint;
  final InputBorder? inputBorder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        onChanged: (value) => onChanged!(value),
        decoration: InputDecoration(
          hintText: hint!,
          border: inputBorder,
        ),
      ),
    );
  }
}

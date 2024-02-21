import 'package:flutter/material.dart';

class FormFieldData {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final int? maxLength;
  final int? maxLines;

  FormFieldData({
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.maxLength,
    this.maxLines,
  });
}

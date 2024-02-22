import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class FormFieldData {
  TextEditingController? controller;
  MaskedTextController? maskedController;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;

  DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  List<String>? radioOptions;
  String? radioValue;
  bool? isChecked;

  FormFieldData({
    TextEditingController? controller,
    String? mask,
    required this.label,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.selectedDate,
    this.onDateSelected,
    this.radioOptions,
    this.radioValue,
    this.isChecked,
  })  : this.controller = controller ?? TextEditingController(),
        this.maskedController =
            mask != null ? MaskedTextController(mask: mask) : null;

  TextEditingController get effectiveController =>
      maskedController ?? controller ?? TextEditingController();

  factory FormFieldData.date({
    required String label,
    required DateTime selectedDate,
    required Function(DateTime) onDateSelected,
  }) =>
      FormFieldData(
        label: label,
        selectedDate: selectedDate,
        onDateSelected: onDateSelected,
      );

  factory FormFieldData.radio({
    required String label,
    required List<String> options,
    required String radioValue,
  }) =>
      FormFieldData(
        label: label,
        radioOptions: options,
        radioValue: radioValue,
      );

  factory FormFieldData.checkbox({
    required String label,
    required bool isChecked,
  }) =>
      FormFieldData(
        label: label,
        isChecked: isChecked,
      );
}

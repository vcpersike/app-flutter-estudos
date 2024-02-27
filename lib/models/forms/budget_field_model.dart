import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class BudgetFieldData {
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


  final bool isSpecial;
   final bool isPasswordField;
  bool isPasswordVisible;

  BudgetFieldData({
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
    this.isSpecial = false,
    this.isPasswordField = false,
    this.isPasswordVisible = false,
  })  : this.controller = controller ?? TextEditingController(),
        this.maskedController =
            mask != null ? MaskedTextController(mask: mask) : null;

  TextEditingController get effectiveController =>
      maskedController ?? controller ?? TextEditingController();

  factory BudgetFieldData.date({
    required String label,
    required DateTime selectedDate,
    required Function(DateTime) onDateSelected,
    bool isSpecial = false,
  }) =>
      BudgetFieldData(
        label: label,
        selectedDate: selectedDate,
        onDateSelected: onDateSelected,
        isSpecial: isSpecial,
      );

  factory BudgetFieldData.radio({
    required String label,
    required List<String> options,
    required String radioValue,
    bool isSpecial = false,
  }) =>
      BudgetFieldData(
        label: label,
        radioOptions: options,
        radioValue: radioValue,
        isSpecial: isSpecial,
      );

  factory BudgetFieldData.checkbox({
    required String label,
    required bool isChecked,
    bool isSpecial = false,
  }) =>
      BudgetFieldData(
        label: label,
        isChecked: isChecked,
        isSpecial: isSpecial,
      );

  factory BudgetFieldData.password({
    required String label,
    required String? Function(String?) validator,
    bool isSpecial = false,
  }) =>
      BudgetFieldData(
        label: label,
        validator: validator,
        isPasswordField: true,
        isSpecial: isSpecial,
      );
}

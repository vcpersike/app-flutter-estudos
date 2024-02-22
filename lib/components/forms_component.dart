import 'package:estudos/models/form_fiel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DynamicFormComponent extends StatefulWidget {
  final List<String>? includeFields;
  final Function(Map<String, String>) onFormSubmit;

  const DynamicFormComponent({
    Key? key,
    this.includeFields,
    required this.onFormSubmit,
  }) : super(key: key);

  @override
  _DynamicFormComponentState createState() => _DynamicFormComponentState();
}

class _DynamicFormComponentState extends State<DynamicFormComponent> {
  final _formKey = GlobalKey<FormState>();
  List<FormFieldData> _fields = [];

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    _fields = createFormFields(includeFields: widget.includeFields);
  }

  void _submitForm() {
  if (_formKey.currentState!.validate()) {
    Map<String, String> formData = {};

    for (var field in _fields) {
      String rawValue = field.effectiveController.text;
      if (field.label == "CPF" || field.label == "Telefone") {
        String unmaskedValue = rawValue.replaceAll(RegExp(r'[^0-9]'), '');
        formData[field.label] = unmaskedValue;
      } else {
        formData[field.label] = rawValue;
      }
      if (field.selectedDate != null) {
        formData["Data de Nascimento"] = DateFormat('dd-MM-yyyy').format(field.selectedDate!);
      }
      if (field.isChecked != null) {
        formData["Aceitar Termos"] = field.isChecked!.toString();
      }
    }
    widget.onFormSubmit(formData);
  }
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: _fields.map<Widget>((FormFieldData field) {
          if (field.radioOptions != null && field.radioValue != null) {
            return Column(
              children: field.radioOptions!
                  .map((option) => RadioListTile(
                        title: Text(option),
                        value: option,
                        groupValue: field.radioValue,
                        onChanged: (String? value) {
                          setState(() {
                            field.radioValue = value;
                          });
                        },
                      ))
                  .toList(),
            );
          } else if (field.isChecked != null) {
            return CheckboxListTile(
              title: Text('Aceitar Termos'),
              value: field
                  .isChecked,
              onChanged: (bool? value) {
                setState(() {
                  field.isChecked = value!;
                });
              },
            );
          } else if (field.selectedDate != null) {
            return ListTile(
              title: Text(field.label),
              subtitle: Text(
                field.selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(field.selectedDate!)
                    : 'Selecione uma data',
              ),
              onTap: () => _selectDate(field),
            );
          } else {
            return TextFormField(
              controller: field.effectiveController,
              decoration: InputDecoration(labelText: field.label),
              keyboardType: field.keyboardType,
              validator: field.validator,
              maxLength: field.maxLength,
              maxLines: field.maxLines,
            );
          }
        }).toList()
          ..add(ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ))
          ..add(SizedBox.shrink()),
      ),
    );
  }

  void _selectDate(FormFieldData field) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: field.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != field.selectedDate) {
      setState(() {
        field.selectedDate = picked;
        if (field.onDateSelected != null) {
          field.onDateSelected!(picked);
        }
      });
    }
  }

  List<FormFieldData> createFormFields({List<String>? includeFields}) {
    List<FormFieldData> allFields = [
      FormFieldData(
        controller: TextEditingController(),
        label: "Nome",
        validator: (value) =>
            value != null && value.isNotEmpty ? null : 'Nome é obrigatório',
      ),
      FormFieldData(
        controller: TextEditingController(),
        label: "Email",
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Email é obrigatório';
          if (!value.contains('@')) return 'Insira um email válido';
          return null;
        },
      ),
      FormFieldData(
        controller: TextEditingController(),
        label: "CPF",
        keyboardType: TextInputType.number,
        validator: (value) => value != null && value.length == 11
            ? null
            : 'CPF deve ter 11 dígitos',
      ),
      FormFieldData(
        controller: TextEditingController(),
        mask: "(00)00000-0000",
        label: "Telefone",
        keyboardType: TextInputType.phone,
        validator: (value) =>
            value != null && value.isNotEmpty ? null : 'Telefone é obrigatório',
      ),
      FormFieldData(
        controller: TextEditingController(),
        label: "Descrição",
        maxLength: 700,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        validator: (value) => value != null && value.isNotEmpty
            ? null
            : 'Descrição é obrigatória',
      ),
      FormFieldData.radio(
        label: "Gênero",
        options: ["Masculino", "Feminino"],
        radioValue: "Masculino",
      ),
      FormFieldData.checkbox(
        label: "Aceitar Termos",
        isChecked: false,
      ),
      FormFieldData.date(
        label: "Data de Nascimento",
        selectedDate: DateTime.now(),
        onDateSelected: (DateTime date) {},
      ),
    ];
    if (includeFields == null || includeFields.isEmpty) {
      return allFields;
    }
    return allFields
        .where((field) => includeFields.contains(field.label))
        .toList();
  }
}

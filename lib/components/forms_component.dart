import 'package:estudos/models/form_field_data.dart';
import 'package:estudos/models/form_field_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DynamicFormComponent extends StatefulWidget {
  final List<String>? includeFields;
  final Function(Map<String, String>) onFormSubmit;

  const DynamicFormComponent({
    super.key,
    this.includeFields,
    required this.onFormSubmit,
  });

  @override
  _DynamicFormComponentState createState() => _DynamicFormComponentState();
}

class _DynamicFormComponentState extends State<DynamicFormComponent> {
  final _formKey = GlobalKey<FormState>();
  List<FormFieldData> _fields = [];
  String _selectedGender = 'Masculino';

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
      // Para campos de texto e senha
      if (field.label == FormFieldNames.nome ||
          field.label == FormFieldNames.email ||
          field.label == FormFieldNames.username ||
          field.label == FormFieldNames.descricao) {
        formData[field.label] = field.effectiveController.text;
      }

      // Para CPF e Telefone, removendo máscaras
      if (field.label == FormFieldNames.cpf || field.label == FormFieldNames.telefone) {
        String unmaskedValue = field.effectiveController.text.replaceAll(RegExp(r'[^0-9]'), '');
        formData[field.label] = unmaskedValue;
      }

      // Para o campo de senha (se você adicionar a lógica de isPasswordField ao FormFieldData)
      if (field.isPasswordField == true) {
        formData[field.label] = field.effectiveController.text; // Considere a criptografia ou validação adequada
      }

      // Para Data de Nascimento
      if (field.selectedDate != null) {
        formData["Data de Nascimento"] = DateFormat('dd-MM-yyyy').format(field.selectedDate!);
      }

      // Para Aceitar Termos (checkbox)
      if (field.isChecked != null) {
        formData["Aceitar Termos"] = field.isChecked!.toString();
      }

      // Para campos de rádio como Gênero e Etapas de Desenvolvimento
      if (field.radioValue != null) {
        if (field.label == FormFieldNames.genero) {
          formData["Gênero"] = field.radioValue!;
        }
        if (field.label == FormFieldNames.etapasDesenvolvimento) {
          formData["Etapas de Desenvolvimento"] = field.radioValue!;
        }
      }
    }

    widget.onFormSubmit(formData);
  }
}


  @override
  Widget build(BuildContext context) {
    EdgeInsets buttonPadding = const EdgeInsets.symmetric(vertical: 16.0);
    bool hasSpecialField = _fields.any((field) => field.isSpecial);
    if (hasSpecialField) {
      buttonPadding = const EdgeInsets.symmetric(vertical: 32.0);
    }

    return Form(
      key: _formKey,
      child: Column(
        children: _fields.map<Widget>((FormFieldData field) {
          if (field.radioOptions != null && field.radioValue != null) {
            return Column(
              children: [
                Text(field.label),
                ...field.radioOptions!
                    .map((option) => RadioListTile<String>(
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
              ],
            );
          } else if (field.isChecked != null) {
            return CheckboxListTile(
              title: Text(field.label),
              value: field.isChecked,
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
          ..add(Padding(
            padding: buttonPadding,
            child: SizedBox(
              width: double.infinity,
              height: 36.0,
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ))
          ..add(const SizedBox.shrink()),
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
        label: "Nome de usuário",
        validator: (value) => value != null && value.isNotEmpty
            ? null
            : 'Nome de usuário é obrigatório',
        controller: TextEditingController(),
      ),
      FormFieldData.password(
        label: "Senha",
        validator: (value) => value != null && value.length >= 6
            ? null
            : 'A senha deve ter pelo menos 8 caracteres',
      ),
      FormFieldData(
        controller: TextEditingController(),
        mask: "000.000.000-00",
        label: "CPF",
        keyboardType: TextInputType.number,
        validator: (value) {
          String numericValue = value?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
          return numericValue.length == 11 ? null : 'CPF deve ter 11 dígitos';
        },
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
      FormFieldData.radio(
        label: "Etapas de Desenvolvimento",
        options: ["Front", "Back", "Mobile"],
        radioValue: "",
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

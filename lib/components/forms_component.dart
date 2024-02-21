import 'package:estudos/models/form_fiel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      for (FormFieldData field in _fields) {
        formData[field.label] = field.controller.text;
      }

      widget.onFormSubmit(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ..._fields.map((field) => TextFormField(
                controller: field.controller,
                decoration: InputDecoration(labelText: field.label),
                keyboardType: field.keyboardType,
                validator: field.validator,
                maxLength: field.maxLength,
                maxLines: field.maxLines,
              )),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
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
      validator: (value) =>
          value != null && value.isNotEmpty ? null : 'Descrição é obrigatória',
    ),
    // Adicione outros campos aqui conforme necessário...
  ];

  if (includeFields == null || includeFields.isEmpty) {
    return allFields;
  }

  return allFields
      .where((field) => includeFields.contains(field.label))
      .toList();
}

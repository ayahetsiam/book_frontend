import 'package:flutter/material.dart';

class AppTextFileld extends StatelessWidget {
  const AppTextFileld({
    super.key,
    required this.textInputType,
    required this.labeltext,
    required this.validator,
    required this.textEditingController,
    this.hinttext,
    this.readOnly,
    this.onsaved,
  });

  final TextInputType textInputType;
  final String? hinttext;
  final String labeltext;
  final bool? readOnly;
  final Function(String?) validator;
  final Function(String?)? onsaved;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hinttext ?? "",
        labelText: labeltext,
      ),
      autovalidateMode: AutovalidateMode.always,
      keyboardType: textInputType,
      keyboardAppearance: Theme.of(context).brightness,
      readOnly: readOnly ?? false,
      validator: (value) => validator(value),
      onSaved: (value) => onsaved ?? (value),
      controller: textEditingController,
    );
  }
}

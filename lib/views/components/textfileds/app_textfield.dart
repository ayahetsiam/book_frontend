import 'package:flutter/material.dart';

class AppTextFileld extends StatelessWidget {
  const AppTextFileld(
      {super.key,
      required this.textInputType,
      required this.labeltext,
      //required this.validator,
      //required this.onSaveFonction,
      required this.textEditingController,
      this.hinttext,
      this.readOnly});

  final TextInputType textInputType;
  final String? hinttext;
  final String labeltext;
  final bool? readOnly;
  //Afinal Function(String?) validator;
  //final Function onSaveFonction;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,

      decoration: InputDecoration(
        hintText: hinttext ?? "",
        labelText: labeltext,
      ),
      autocorrect: true,
      keyboardType: textInputType,
      keyboardAppearance: Theme.of(context).brightness,
      readOnly: readOnly ?? false,
      /*validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },*/
      //validator: (value) => validator(value),
      //onSaved: (value) => onSaveFonction(value),
      controller: textEditingController,
    );
  }
}

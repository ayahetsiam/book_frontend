import 'package:flutter/material.dart';

class AppComboboxTextField extends StatefulWidget {
  const AppComboboxTextField({super.key, required this.options});
 final List<String> options;
  @override
  State<AppComboboxTextField> createState() => _AppComboboxTextFieldState();
}

class _AppComboboxTextFieldState extends State<AppComboboxTextField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButtonFormField<String>(
          value: _selectedValue,
          onChanged: (String? value) {
            setState(() {
              _selectedValue = value;
            });
          },
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: "Author",
          ),
        ),
      ],
    );
  }
}

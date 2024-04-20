import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({
    Key? key,
    required this.textInputType,
    required this.hinttext,
    required this.labeltext,
    required this.icon,
    required this.textEditingController,
  }) : super(key: key);

  final TextInputType textInputType;
  final String hinttext;
  final String labeltext;
  final IconData icon;
  final TextEditingController textEditingController;

  @override
  DateTextFieldState createState() => DateTextFieldState();
}

class DateTextFieldState extends State<DateTextField> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.textEditingController.text.isNotEmpty) {
      _selectedDate = DateTime.tryParse(
        widget.textEditingController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        labelText: widget.labeltext,
        suffixIcon: IconButton(
          onPressed: () {
            _selectDate(context);
          },
          icon: Icon(widget.icon),
        ),
      ),
      autocorrect: false,
      keyboardType: widget.textInputType,
      keyboardAppearance: Theme.of(context).brightness,
      controller: widget.textEditingController,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.textEditingController.text =
            "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}";
      });
    }
  }
}

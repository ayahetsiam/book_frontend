import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onConfirmDeleting
  }) : super(key: key);
  final String title;
  final String content;
  final Function onConfirmDeleting;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Non"),
        ),
        TextButton(
          onPressed: () {
            onConfirmDeleting;
          },
          child: const Text("Oui"),
        ),
      ],
    );
  }
}

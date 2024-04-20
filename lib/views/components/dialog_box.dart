import 'package:flutter/material.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final Widget content;

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: widget.content,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Fermez la boîte de dialogue avec la valeur false
          },
          child: const Text("Non"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(true); // Fermez la boîte de dialogue avec la valeur true
          },
          child: const Text("Oui"),
        ),
      ],
    );
  }
}

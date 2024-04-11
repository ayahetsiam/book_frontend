import 'package:flutter/material.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onConfirmDeleting})
      : super(key: key);
  final String title;
  final Widget content;
  final Function? onConfirmDeleting;

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
            Navigator.of(context).pop(false);
          },
          child: const Text("Non"),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirmDeleting;
          },
          child: const Text("Oui"),
        ),
      ],
    );
  }
}

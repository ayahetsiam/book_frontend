import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingDialogBox extends StatelessWidget {
  final String operationText;
  const LoadingDialogBox({
    super.key,
    required this.operationText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            const Gap(16),
            Text(operationText),
          ],
        ),
      ),
    );
  }
}

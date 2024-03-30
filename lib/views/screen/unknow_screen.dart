import 'package:flutter/material.dart';

class UnknowScreen extends StatelessWidget {
  const UnknowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Vous tentez avoir accès à une page inexistant"),
      ),
    );
  }
}

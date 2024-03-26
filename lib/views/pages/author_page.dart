import 'package:book_ui/views/components/author_tile.dart';
import 'package:flutter/material.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: List.generate(
              10,
              (index) => const AuthorTile(
                    title: "Gustave Flauber",
                  ))),
      floatingActionButton: const FloatingActionButton(
          onPressed: null, child: Icon(Icons.person_add_alt_outlined)),
    );
  }
}

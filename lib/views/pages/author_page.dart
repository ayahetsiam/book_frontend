import 'package:book_ui/views/components/author_tile.dart';
import 'package:flutter/material.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  onPressOnAddAuthor(BuildContext context) {
    Navigator.of(context).pushNamed("addAuthor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: List.generate(
              10,
              (index) => const AuthorTile(
                    title: "Gustave Flauber",
                  ))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {onPressOnAddAuthor(context)},
          child: const Icon(Icons.person_add_alt_outlined)),
    );
  }
}

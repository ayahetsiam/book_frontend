import 'package:book_ui/views/components/book_tile.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});
  onPressOnAddBook(BuildContext context) {
    Navigator.of(context).pushNamed("addBook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: BookTile(
                        title: "Le roi et sa chèvre",
                        subtitle: Text.rich(TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(
                                  text:
                                      "Livre de 124 pages, écrit le 15 fevrier 1950 dans "),
                              TextSpan(
                                  text: "sous l'orage",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)),
                              TextSpan(text: " par Gustave flaubert")
                            ]))),
                  ))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            onPressOnAddBook(context);
          },
          child: const Icon(Icons.bookmark_add_outlined)),
    );
  }
}

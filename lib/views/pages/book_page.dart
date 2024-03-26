import 'package:book_ui/views/components/book_tile.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: List.generate(
              10,
              (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: BookTile(
                        title: "Le roi et sa chèvre",
                        subtitle:
                            "Livre de 124 pages, écrit le 15 fevrier 1950 dans sous l'orage par Gustave flaubert"),
                  ))),
      floatingActionButton: const FloatingActionButton(
          onPressed: null, child: Icon(Icons.bookmark_add_outlined)),
    );
  }
}

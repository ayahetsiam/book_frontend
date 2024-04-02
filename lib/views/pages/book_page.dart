
import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/book_tile.dart';
import 'package:flutter/material.dart';
import '../../data/dataSources/book_data_source.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  onPressOnAddBook() {
    Navigator.of(context).pushNamed("addBook");
  }

  late List<BookModel> bookData;

  getBooks() {
    bookData = bookDb.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BookTile(
           book: bookData[index],
          );
        },
        itemCount: bookData.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            onPressOnAddBook();
          },
          child: const Icon(Icons.bookmark_add_outlined)),
    );
  }
}

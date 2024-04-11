import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../data/dataSources/book_query.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Query(
          options: QueryOptions(document: gql(getBooks)),
          builder: (result, {fetchMore, refetch}) {
            debugPrint("etape 0");
            debugPrint(
              result.toString(),
            );
            if (result.hasException) {
              return Center(
                child: Text(
                  result.exception.toString(),
                ),
              );
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List books = result.data!["books"] as List;
            bookData = books
                .map(
                  (bookJson) => BookModel.fromJson(bookJson),
                )
                .toList();
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: ((context, index) =>
                  BookTile(book: bookData[index])),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("addBook");
          },
          child: const Icon(Icons.bookmark_add_outlined),
        ),
      
    );
  }
}

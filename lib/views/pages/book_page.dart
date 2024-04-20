import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/animations/book_tile_shimmer.dart';
import 'package:book_ui/views/components/book_tile.dart';
import 'package:book_ui/views/configs/style.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/endpoint/book_endpoint.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<BookModel> _bookData = [];
  onPressOnAddBook() {
    Navigator.of(context).pushNamed("addBook");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(document: gql(BookEndPoint.getBooksQuery)),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_outlined,
                    size: 14,
                    color: Colors.grey,
                  ),
                  Text(
                    "Erreur de connexion",
                    style: AppStyle.notImportantTitleTextStyle,
                  ),
                  Text(
                    "Vérifiez votre connexion Wi-Fi ou Internet.",
                    style: AppStyle.notImportantTitleTextStyle,
                  ),
                ],
              ),
            );
          }

          if (result.isLoading) {
            return Shimmer(
              gradient: AppStyle.shimmerGradient,
              child: ListView(
                children: List.generate(
                  10,
                  (index) => const BookTileShimmer(),
                ),
              ),
            );
          }

          List books = result.data!["books"] as List;
          _bookData = books
              .map(
                (bookJson) => BookModel.fromJson(bookJson),
              )
              .toList();

          return _bookData.isEmpty
              ? const Center(
                  child: Text(
                    "Aucun Livre",
                    style: AppStyle.notImportantTitleTextStyle,
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) =>
                      BookTile(book: _bookData[index]),
                  itemCount: _bookData.length,
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

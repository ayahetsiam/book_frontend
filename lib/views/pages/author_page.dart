import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/author_tile.dart';
import 'package:flutter/material.dart';
import 'package:book_ui/data/dataSources/author_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  late List<AuthorModel> authorData;

  onPressOnAddAuthor() {
    Navigator.of(context).pushNamed("addAuthor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(getAuthorsQuery),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return const Center(
              child: Text("il y a une erreur"),
            );
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final List authors = result.data?["authors"];
          authorData = authors.map((e) => AuthorModel.fromJson(e)).toList();
          //debugPrint(authors.toString());
          return ListView.builder(
            itemBuilder: (context, index) =>
                AuthorTile(author: authorData[index]),
            itemCount: authorData.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          onPressOnAddAuthor(),
        },
        child: const Icon(Icons.person_add_alt_outlined),
      ),
    );
  }
}

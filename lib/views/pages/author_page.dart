import 'package:book_ui/data/endpoint/author_endpoint.dart';
import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/animations/author_tile_shimmer.dart';
import 'package:book_ui/views/components/author_tile.dart';
import 'package:book_ui/views/configs/style.dart';
import 'package:book_ui/views/screen/add_author_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shimmer/shimmer.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  late List<AuthorModel> authorData;

  onPressOnAddAuthor() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddAuthorScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(AuthorEndPoint.getAuthorsQuery),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
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
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Shimmer(
                gradient: AppStyle.shimmerGradient,
                child: const AuthorTileShimmer(),
              ),
            );
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

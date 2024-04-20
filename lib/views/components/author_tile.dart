// ignore_for_file: use_build_context_synchronously

import 'package:book_ui/data/endpoint/book_endpoint.dart';
import 'package:book_ui/data/mutations/author_mutation.dart';
import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:book_ui/views/components/loading_dialog_box.dart';
import 'package:book_ui/views/screen/author_books_screen.dart';
import 'package:book_ui/views/screen/modify_author_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthorTile extends StatefulWidget {
  const AuthorTile({
    Key? key,
    required this.author,
  }) : super(key: key);

  final AuthorModel author;

  @override
  State<AuthorTile> createState() => _AuthorTileState();
}

class _AuthorTileState extends State<AuthorTile> {
  Future<void> clickOnDelete(AuthorModel author) async {
    final confirmed = await showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "Confirmation",
        content: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Êtes-vous sûr de vouloir supprimer l'auteur ",
              ),
              TextSpan(
                text: "${author.firstname} ${author.name} ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const TextSpan(text: "?"),
            ],
          ),
        ),
      ),
    );

    if (confirmed ?? false) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingDialogBox(
          operationText: "Suppression en cours...",
        ),
      );

      try {
        final result = await AuthorMutation.deleteMutation(
          context: context,
          authorKey: author.id,
        );
        if (result.hasException) {
          print("erreur de suppression");
        } else {
          aftersucces();
        }
      } catch (e) {
        print(e.toString());
      } finally {
        Navigator.of(context)
            .pop(); // Fermez la boîte de dialogue de chargement
      }
    }
  }

  void aftersucces() {
    Navigator.of(context).pop(); // Fermez la boîte de dialogue de chargement
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Auteur supprimé avec succès'),
      ),
    );
  }

  void clickOnModify(AuthorModel author) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModifyAuthorScreen(
          author: author,
        ),
      ),
    );
  }

  void clickOnDetail(List<BookModel> authorBooks) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuthorDetailScreen(
          author: widget.author,
          authorBooks: authorBooks,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(BookEndPoint.getBookByAuthorQuery),
        variables: {"authorid": widget.author.id},
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return ExpansionTile(
            title: Text(
              "${widget.author.firstname} ${widget.author.name}",
            ),
            leading: const Icon(Icons.person_3_outlined),
            children: const [
              CircularProgressIndicator(),
            ],
          );
        }
        //recuperation en json et conversion en AuthorModel
        List books = result.data!["authorsBooks"] as List;
        final authorBooks =
            books.map((bookJson) => BookModel.fromJson(bookJson)).toList();
        int authorBooksNumber = authorBooks.length;
        String authorSubtitle = authorBooksNumber == 0
            ? "Aucun livre n'est enregistré pour cet auteur"
            : authorBooksNumber == 1
                ? "Auteur de $authorBooksNumber livre"
                : "Auteur de $authorBooksNumber livres";
        return ExpansionTile(
          title: Text(
            "${widget.author.firstname} ${widget.author.name}",
          ),
          leading: const Icon(Icons.person_3_outlined),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    authorSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => clickOnModify(widget.author),
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.blue,
                  ),
                ),
                if (authorBooksNumber == 0)
                  IconButton(
                    onPressed: () async {
                      await clickOnDelete(widget.author);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                if (authorBooksNumber != 0)
                  IconButton(
                    onPressed: () => clickOnDetail(authorBooks),
                    icon: const Icon(
                      Icons.read_more,
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

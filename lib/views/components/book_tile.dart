import 'package:book_ui/data/dataSources/author_queries.dart';
import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:book_ui/views/configs/colors/common_colors.dart';
import 'package:book_ui/views/screen/modify_book_screen.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BookTile extends StatefulWidget {
  final BookModel book;

  const BookTile({super.key, required this.book, e});

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  late AuthorModel author;
  void deleteOperation() {
    //debugPrint("alaj");
  }

  void clickOnDelete() {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
            title: "Confirmation",
            content: Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(
                      text:
                          "Êtes-vous sûr de vouloir supprimer le livre intitulé "),
                  TextSpan(
                      text: widget.book.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  TextSpan(text: " de ${author.firstname} ${author.name} ?"),
                ],
              ),
            ),
            onConfirmDeleting: deleteOperation),
        barrierDismissible: false);
  }

  void clickOnModify() {
    //Navigator.of(context).pushNamed("modifyBook");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModifyBookScreen(
          book: widget.book,
          bookAuthor: author
        ),
      ),
    ); //pass any arguments),
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.book_outlined),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        widget.book.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => clickOnModify(),
                            icon: Icon(
                              Icons.edit_outlined,
                              color: AppColor.updateColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              clickOnDelete();
                              //il y a un probleme
                              ScaffoldMessenger.of(context).showSnackBar(
                                  AppSnackBar(
                                      snackContent:
                                          "Livre supprimé avec succès"));
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: AppColor.deleteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Query(
                    options: QueryOptions(
                      document: gql(getAuthorByIdQuery),
                      variables: {"authorId": widget.book.author},
                    ),
                    builder: (result, {fetchMore, refetch}) {
                      if (result.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      if (result.hasException) {
                        debugPrint("erreur de recuperation d'un auteur");
                      }
                      var bookauthor = result.data!["author"];
                      author = AuthorModel.fromJson(bookauthor); 
                      return Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text:
                                    "Livre de ${widget.book.page} pages, écrit le ${widget.book.writtenAt} dans "),
                            TextSpan(
                                text: widget.book.artwork,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                                text:
                                    " par ${author.firstname} ${author.name}."),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

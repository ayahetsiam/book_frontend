import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:book_ui/views/screen/author_books_screen.dart';
import 'package:book_ui/views/screen/modify_author_screen.dart';
import 'package:flutter/material.dart';

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
  void deleteOperation() {
    debugPrint("alaj");
  }

  void clickOnDelete() {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
            title: "Confirmation",
            content: Text.rich(TextSpan(
              children: [
                const TextSpan(
                    text: "Êtes-vous sûr de vouloir supprimer l'auteur "),
                TextSpan(
                    text: "${widget.author.firstname} ${widget.author.name} ",
                    style: Theme.of(context).textTheme.titleMedium),
                const TextSpan(text: "?"),
              ],
            )),
            onConfirmDeleting: deleteOperation),
        barrierDismissible: false);
  }

  void clickOnModify() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModifyAuthorScreen(
          author: widget.author,
        ),
      ),
    );
  }

  void clickOnDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuthorDetailScreen(
          author: widget.author,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "${widget.author.firstname} ${widget.author.name}",
      ),
      leading: const Icon(Icons.person_3_outlined),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Auteur de 1 livre(s)",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => {
                clickOnModify(),
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.blue, // Replace with your color
              ),
            ),
            IconButton(
              onPressed: () => {
                clickOnDelete(),
                ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar(snackContent: "Livre supprimé avec succès"))
              },
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                // Replace with your color
              ),
            ),
            IconButton(
              onPressed: () => clickOnDetail(),
              icon: const Icon(
                Icons.read_more,
                color: Colors.green, // Replace with your color
              ),
            ),
          ],
        )
      ],
    );
  }
}

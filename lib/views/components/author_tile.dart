import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:flutter/material.dart';

class AuthorTile extends StatelessWidget {
  const AuthorTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  void deleteOperation() {
    debugPrint("alaj");
  }

  void clickOnDelete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
            title: "Confirmation",
            content: "Êtes-vous sûr de vouloir supprimer ce livre ?",
            onConfirmDeleting: deleteOperation),
        barrierDismissible: false);
  }

  void clickOnModify(BuildContext context) {
    Navigator.of(context).pushNamed("modifyAuthor");
  }

  void clickOnDetail(BuildContext context) {
    Navigator.of(context).pushNamed("authorBooks");
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
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
                clickOnModify(context),
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.blue, // Replace with your color
              ),
            ),
            IconButton(
              onPressed: () => {
                clickOnDelete(context),
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
              onPressed: () => clickOnDetail(context),
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

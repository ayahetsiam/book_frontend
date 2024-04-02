import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:book_ui/views/configs/colors/common_colors.dart';
import 'package:book_ui/views/screen/modify_book_screen.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final BookModel book;

  const BookTile({
    super.key,
    required this.book,
  });

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  void deleteOperation() {
    //debugPrint("alaj");
  }

  void clickOnDelete() {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
            title: "Confirmation",
            content: Text.rich(TextSpan(
              children: [
                const TextSpan(
                    text:
                        "Êtes-vous sûr de vouloir supprimer le livre intitulé "),
                TextSpan(
                    text: widget.book.title,
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text:
                        " de ${widget.book.author.firstname} ${widget.book.author.name} ?"),
              ],
            )),
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
                  Text.rich(
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
                                " ${widget.book.author.firstname} ${widget.book.author.name}"),
                      ],
                    ),
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

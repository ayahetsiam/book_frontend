import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/dialog_box.dart';
import 'package:book_ui/views/configs/colors/common_colors.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.title, required this.subtitle});

  final String title;
  final Text subtitle;

  void deleteOperation() {
    debugPrint("alaj");
  }

  void clickOnDelete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
            title: "Confirmation",
            content: "Êtes-vous sûr de vouloir supprimer cet auteur ?",
            onConfirmDeleting: deleteOperation),
        barrierDismissible: false);
  }

  void clickOnModify(BuildContext context) {
    Navigator.of(context).pushNamed("modifyBook");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      Row(children: [
                        IconButton(
                            onPressed: () => clickOnModify(context),
                            icon: Icon(
                              Icons.edit_outlined,
                              color: AppColor.updateColor,
                            )),
                        IconButton(
                            onPressed: () {
                              clickOnDelete(context);
                              //il y a un probleme
                              ScaffoldMessenger.of(context).showSnackBar(
                                  AppSnackBar(
                                      snackContent:
                                          "Livre supprimé avec succès"));
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: AppColor.deleteColor,
                            )),
                      ]),
                    ],
                  ),
                  subtitle
                ],
              ),
            )
          ],
        ));
  }
}

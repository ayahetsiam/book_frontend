import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/data/models/book_models.dart';
import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/configs/style.dart';

class ModifyBookScreen extends StatefulWidget {
  final BookModel book;
  final AuthorModel bookAuthor;
  const ModifyBookScreen({
    super.key,
    required this.book,
    required this.bookAuthor,
  });

  @override
  State<ModifyBookScreen> createState() => _ModifyBookScreenState();
}

class _ModifyBookScreenState extends State<ModifyBookScreen> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController artworkTextController = TextEditingController();
  TextEditingController pageNumberTextController = TextEditingController();

  String? titleValidator(String? value) {
    return value != null && value.contains("@")
        ? "le titre ne doit pas avoir @"
        : null;
  }

  String? artworkValidator(String? value) {
    return value != null && value.contains("@")
        ? "l'oeuvre ne doit pas avoir @"
        : null;
  }

  String? pageNumberValidator(String? value) {
    return (value!.isNotEmpty && int.tryParse(value) == null)
        ? "Le nombre de page doit être un entier"
        : null;
  }

  void validateForm(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(AppSnackBar(snackContent: "Livre modifié avec succès"));
  }

  getDefault() {
    titleTextController.text = widget.book.title;
    artworkTextController.text = widget.book.artwork;
    pageNumberTextController.text = widget.book.page.toString();
  }

  @override
  void initState() {
    getDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier un livre",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text("ISBN : ",
                                  style: AppStyle.notImportantTitleTextStyle),
                              const Gap(4),
                              Text(widget.book.isbn),
                            ],
                          ),
                          const Gap(16),
                          Row(
                            children: [
                              const Text("Auteur : ",
                                  style: AppStyle.notImportantTitleTextStyle),
                              const Gap(4),
                              Text(
                                  "${widget.bookAuthor.firstname} ${widget.bookAuthor.name}"),
                            ],
                          ),
                          const Gap(16),
                          Row(
                            children: [
                              const Text("Date de publication : ",
                                  style: AppStyle.notImportantTitleTextStyle),
                              const Gap(4),
                              Text(widget.book.writtenAt),
                            ],
                          ),
                        ],
                      ),
                      const Gap(24),
                      AppTextFileld(
                        textEditingController: titleTextController,
                        textInputType: TextInputType.name,
                        labeltext: "Titre *",
                        validator: (value) => titleValidator(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: artworkTextController,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez l'oeuvre",
                        labeltext: "Oeuvre *",
                        validator: (value) => artworkValidator(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: pageNumberTextController,
                        textInputType: TextInputType.number,
                        hinttext: "Entrez le nombre de pages",
                        labeltext: "Nombre de pages *",
                        validator: (value) => pageNumberValidator(value),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                ElevatedButton(
                    onPressed: () => validateForm(context),
                    child: const Text("Valider"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

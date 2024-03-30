import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModifyBookScreen extends StatelessWidget {
  const ModifyBookScreen({super.key});

  /*isbnValidator(String? value) {
    debugPrint(value);
    (value != null && value.contains("@") ? "Nom ne doit pas avoir @" : null);
  }

  titleValidator(String? value) {
    (value != null && value.contains("@") ? "Nom ne doit pas avoir @" : null);
  }

  onSaveName(String? value) {
    (value == "" ? "Nom ne doit vide" : null);
  }

  onSaveFirstName(String? value) {
    (value == "" ? "Nom ne doit vide" : null);
  }*/

  void validateForm(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(AppSnackBar(snackContent: "Livre modifié avec succès"));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController isbnTextController = TextEditingController();
    TextEditingController titleTextController = TextEditingController();
    TextEditingController artworkTextController = TextEditingController();
    TextEditingController pageNumberTextController = TextEditingController();
    TextEditingController dateTextController = TextEditingController();
    TextEditingController authorTextController =
        TextEditingController(text: "ama");
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
                      AppTextFileld(
                        textEditingController: isbnTextController,
                        textInputType: TextInputType.name,
                        //hinttext: "Entrez ISBN du libre",
                        labeltext: "ISBN *",
                        readOnly: true,
                        //validator: (value) => isbnValidator(value),
                        //onSaveFonction: (value) => onSaveName(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: titleTextController,
                        textInputType: TextInputType.name,
                        //hinttext: "Entrez le titre",
                        labeltext: "Titre *",
                        //validator: (value) => titleValidator(value),
                        //onSaveFonction: (value) => onSaveFirstName(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: artworkTextController,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez l'oeuvre",
                        labeltext: "Oeuvre *",
                        //validator: (value) => titleValidator(value),
                        //onSaveFonction: (value) => onSaveFirstName(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: pageNumberTextController,
                        textInputType: TextInputType.number,
                        hinttext: "Entrez le nombre de pages",
                        labeltext: "Nombre de pages *",
                        //validator: (value) => titleValidator(value),
                        //onSaveFonction: (value) => onSaveFirstName(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: dateTextController,
                        textInputType: TextInputType.datetime,
                        //hinttext: "Entrez la date de publication",
                        labeltext: "Date de publication ",
                        readOnly: true,
                        //validator: (value) => titleValidator(value),
                        //onSaveFonction: (value) => onSaveFirstName(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: authorTextController,
                        textInputType: TextInputType.datetime,
                        //hinttext: "Entrez la date de publication",
                        labeltext: "Auteur ",
                        readOnly: true,
                        //validator: (value) => titleValidator(value),
                        //onSaveFonction: (value) => onSaveFirstName(value),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      onPressed: () => validateForm(context),
                      child: const Text('Valider'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

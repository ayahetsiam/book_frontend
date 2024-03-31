import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModifyBookScreen extends StatelessWidget {
  const ModifyBookScreen({super.key});

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
                        labeltext: "ISBN *",
                        readOnly: true,
                        validator: (value) => null,
                      ),
                      const Gap(16),
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
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: dateTextController,
                        textInputType: TextInputType.datetime,
                        labeltext: "Date de publication ",
                        readOnly: true,
                        validator: (value) => titleValidator(value),
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: authorTextController,
                        textInputType: TextInputType.datetime,
                        labeltext: "Auteur",
                        readOnly: true,
                        validator: (value) => titleValidator(value),
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

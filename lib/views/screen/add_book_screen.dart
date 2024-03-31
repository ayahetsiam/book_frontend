import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/views/components/textfileds/combox_text_field.dart';
import 'package:book_ui/views/components/textfileds/date_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({super.key});

  String? isbnValidator(String? value) {
    return (value != null && value.contains("@"))
        ? "L'ISBN ne doit pas contenir @"
        : null;
  }

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
        .showSnackBar(AppSnackBar(snackContent: "Livre ajouté avec succès"));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController isbnTextController = TextEditingController();
    TextEditingController titleTextController = TextEditingController();
    TextEditingController artworkTextController = TextEditingController();
    TextEditingController pageNumberTextController = TextEditingController();
    TextEditingController dateTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter un livre",
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
                        hinttext: "Entrez ISBN du libre",
                        labeltext: "ISBN *",
                        validator: isbnValidator,
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: titleTextController,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez le titre",
                        labeltext: "Titre *",
                        validator: titleValidator,
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: artworkTextController,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez l'oeuvre",
                        labeltext: "Oeuvre *",
                        validator: artworkValidator,
                      ),
                      const Gap(16),
                      AppTextFileld(
                        textEditingController: pageNumberTextController,
                        textInputType: TextInputType.number,
                        hinttext: "Entrez le nombre de pages",
                        labeltext: "Nombre de pages *",
                        validator: pageNumberValidator,
                      ),
                      const Gap(16),
                      DateTextField(
                        textEditingController: dateTextController,
                        textInputType: TextInputType.datetime,
                        hinttext: "Entrez la date de publication",
                        labeltext: "Date de publication ",
                        icon: Icons.date_range_outlined,
                      ),
                      const Gap(16),
                      const AppComboboxTextField(
                        options: [
                          "Option 1",
                          "Option 2",
                          "Option 3",
                          "Option 4"
                        ],
                      )
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

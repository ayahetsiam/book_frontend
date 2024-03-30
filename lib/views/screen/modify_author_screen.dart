import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';

// ignore: must_be_immutable
class ModifyAuthorScreen extends StatelessWidget {
  const ModifyAuthorScreen({super.key});

  /*String? nameValidator(String? value) {
    if (value != null && value.contains("@")) {
      return "Le nom ne doit pas contenir '@'";
    }
    return null;
  }

  firstNameValidator(String? value) {
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
        .showSnackBar(AppSnackBar(snackContent: "Auteur modifié avec succès"));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextcontroller = TextEditingController();
    TextEditingController firstnameTextcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier un auteur",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      AppTextFileld(
                        textEditingController: nameTextcontroller,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez votre nom",
                        labeltext: "Nom *",
                        //onSaveFonction: (value) => onSaveName(value),
                      ),
                      const Gap(20),
                      AppTextFileld(
                        textEditingController: firstnameTextcontroller,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez votre prenom",
                        labeltext: "Prenom *",
                        //validator: firstNameValidator,
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

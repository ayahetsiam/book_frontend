import 'package:book_ui/views/components/author_books.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class AuthorDetailScreen extends StatelessWidget {
  const AuthorDetailScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Gustave Flaubert",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Gap(16),
                Column(
                    children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8),
                    child: AuthorBooksTile(
                        title: "Le roi et sa chèvre",
                        subtitle: Text.rich(TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(
                                  text:
                                      "Livre de 124 pages, écrit le 15 fevrier 1950 dans "),
                              TextSpan(
                                  text: "sous l'orage",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)),
                            ]))),
                  ),
                ).toList()),
              ],
            )),
      ),
    );
  }
}

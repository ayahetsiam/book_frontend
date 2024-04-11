import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:book_ui/data/dataSources/author_queries.dart';

class ModifyAuthorScreen extends StatefulWidget {
  const ModifyAuthorScreen({super.key, required this.author});
  final AuthorModel author;
  @override
  State<ModifyAuthorScreen> createState() => _ModifyAuthorScreenState();
}

class _ModifyAuthorScreenState extends State<ModifyAuthorScreen> {
  TextEditingController nameTextcontroller = TextEditingController();
  TextEditingController firstnameTextcontroller = TextEditingController();

  String? nameValidator(String? value) {
    return value != null
        ? int.tryParse(value) != null
            ? "Le nom ne doit pas commencer par un chiffre"
            : null
        : null;
  }

  String? firstNameValidator(String? value) {
    return value != null
        ? int.tryParse(value) != null
            ? "Le prénom ne doit pas commencer par un chiffre"
            : null
        : null;
  }

  Future<void> validateForm(Map<String, dynamic> variables) async {
    //print(variables);
    QueryResult result;
    try {
      result = await GraphQLProvider.of(context).value.mutate(MutationOptions(
            document: gql(updateAuthorMutation),
            variables: variables,
          ));
      if (result.isLoading) {
        const CircularProgressIndicator();
      }
     // print(result);
      if (result.data != null) {
        afterSuccess();
      }
    } catch (error) {
      //print(result);
      debugPrint("Erreur lors de la mutation: $error");
    }
  }

  void afterSuccess() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(snackContent: "Auteur modifié avec succès"),
    );
  }

  getDefaultTextFieldValue() {
    nameTextcontroller.text = widget.author.name;
    firstnameTextcontroller.text = widget.author.firstname;
  }

  @override
  void initState() {
    getDefaultTextFieldValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        validator: nameValidator,
                      ),
                      const Gap(20),
                      AppTextFileld(
                        textEditingController: firstnameTextcontroller,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez votre prenom",
                        labeltext: "Prenom *",
                        validator: firstNameValidator,
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> variable = {"key": widget.author.id};
                    if (widget.author.firstname !=
                        firstnameTextcontroller.text) {
                      variable["firstName"] = firstnameTextcontroller.text;
                    }
                    if (widget.author.name != nameTextcontroller.text) {
                      variable["name"] = nameTextcontroller.text;
                    }
                    if (variable.length != 1) {
                      await validateForm(variable);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Valider"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

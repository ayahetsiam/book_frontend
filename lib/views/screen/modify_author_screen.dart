import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';
import 'package:book_ui/data/mutations/author_mutation.dart';

class ModifyAuthorScreen extends StatefulWidget {
  const ModifyAuthorScreen({super.key, required this.author});
  final AuthorModel author;

  @override
  State<ModifyAuthorScreen> createState() => _ModifyAuthorScreenState();
}

class _ModifyAuthorScreenState extends State<ModifyAuthorScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
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
            ? "Le prénom ne doit pas pas commencer par un chiffre"
            : null
        : null;
  }

  String? nameSaver(String? value) {
    return value == null ? "Ce champs est requise" : null;
  }

  // Flag to control loading indicator

  Future<void> submitForm(Map<String, dynamic> variables) async {
    try {
      final result = await AuthorMutation.updateMutation(
          context: context, variables: variables);
      if (result.hasException) {
        //todo: implement this part of code when exception is raised
        print("erreur de modification");
        setState(() {
          _isLoading = false; // Set loading indicator to true
        });
      } else {
        setState(() {
          _isLoading = false; // Set loading indicator to true
        });
        afterSuccess();
      }
    } catch (error) {
      debugPrint("Erreur lors de la mutation: $error");
    } finally {
      setState(() {
        _isLoading = false;
      });
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
    return PopScope(
      canPop: !_isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: !_isLoading,
          title: const Text(
            "Modifier un auteur",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Map<String, dynamic> variable = {
                                "key": widget.author.id
                              };
                              if (widget.author.firstname !=
                                  firstnameTextcontroller.text) {
                                variable["firstName"] =
                                    firstnameTextcontroller.text;
                              }
                              if (widget.author.name !=
                                  nameTextcontroller.text) {
                                variable["name"] = nameTextcontroller.text;
                              }
                              if (variable.length != 1) {
                                await submitForm(variable);
                              } else {
                                Navigator.of(context).pop();
                              }
                            }
                          },
                          child: const Text("Valider"),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

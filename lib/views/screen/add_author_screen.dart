import 'package:book_ui/data/mutations/author_mutation.dart';
import 'package:book_ui/views/components/textfileds/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/components/app_snake_bar.dart';

class AddAuthorScreen extends StatefulWidget {
  const AddAuthorScreen({super.key});

  @override
  State<AddAuthorScreen> createState() => _AddAuthorScreenState();
}

class _AddAuthorScreenState extends State<AddAuthorScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  TextEditingController nameTextcontroller = TextEditingController();
  TextEditingController firstnameTextcontroller = TextEditingController();

  String? nameValidator(String? value) {
    return value != null
        ? (int.tryParse(value) != null) || int.tryParse(value) != null
            ? "Le nom ne doit pas commencer par un chiffre"
            : null
        : null;
  }

  String? firstNameValidator(String? value) {
    return value != null
        ? (int.tryParse(value) != null)
            ? "Le prénom ne doit pas commencer par un chiffre"
            : null
        : null;
  }

  String? nameSaver(String? value) {
    return value == null ? "Ce champs est requise" : null;
  }

  void submitForm(
    Map<String, dynamic> author,
  ) async {
    print(author.toString());
    try {
      final result = await AuthorMutation.createMutation(
        context: context,
        author: author,
      );
      if (result.hasException) {
        //todo: implement this part of code when exception is raised
        print(result.exception.toString());
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          AppSnackBar(snackContent: "Auteur ajouté avec succès"),
        );
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    } finally {
      setState(() {
        _isLoading == false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter un auteur",
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
                        onsaved: nameSaver,
                      ),
                      const Gap(20),
                      AppTextFileld(
                        textEditingController: firstnameTextcontroller,
                        textInputType: TextInputType.name,
                        hinttext: "Entrez votre prenom",
                        labeltext: "Prenom *",
                        validator: firstNameValidator,
                        onsaved: nameSaver,
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            submitForm({
                              'name': nameTextcontroller.text,
                              'firstName': firstnameTextcontroller.text
                            });
                          }
                        },
                        child: const Text("Valider"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/author_tile.dart';
import 'package:flutter/material.dart';
import 'package:book_ui/data/dataSources/author_data_source.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  onPressOnAddAuthor() {
    Navigator.of(context).pushNamed("addAuthor");
  }

  late List<AuthorModel> authorData;

  getAuthors() {
    authorData = authorDb.map((e) => AuthorModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    getAuthors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => AuthorTile(
          author: authorData[index],
        ),
        itemCount: authorData.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {onPressOnAddAuthor()},
          child: const Icon(Icons.person_add_alt_outlined)),
    );
  }
}

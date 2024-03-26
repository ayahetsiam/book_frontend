import 'package:book_ui/views/pages/author_page.dart';
import 'package:book_ui/views/pages/book_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/img/profil.jpg"),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.onPrimary))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Livre'),
                Tab(text: 'Auteur'),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[BookPage(), AuthorPage()],
          ),
        ));
  }
}

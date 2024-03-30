import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:book_ui/views/components/book_tile.dart';
import 'package:book_ui/views/components/author_tile.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    final List<String> tabNames = arguments[1];
    final int tabIndex = arguments[0];
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(tabNames[tabIndex]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Rechercher',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
                style: const TextStyle(fontSize: 16), // Adjust as needed
              ),
            ),
            const Gap(16),
            /*Expanded(
              child: bookPage(context),
            ),*/
            //bookPage(context),
            Expanded(
              child: IndexedStack(
                index: tabIndex,
                children: [
                  bookPage(context),
                  authorPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookPage(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
          child: BookTile(
            title: "Le roi et sa chèvre",
            subtitle: Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: const [
                  TextSpan(
                    text: "Livre de 124 pages, écrit le 15 février 1950 dans ",
                  ),
                  TextSpan(
                    text: "sous l'orage",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: " par Gustave Flaubert"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget authorPage() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const AuthorTile(title: "Gustave Flaubert");
      },
    );
  }
}

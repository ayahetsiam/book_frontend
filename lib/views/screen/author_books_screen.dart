import 'package:book_ui/data/models/author_model.dart';
import 'package:book_ui/views/components/author_books.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthorDetailScreen extends StatefulWidget {
  const AuthorDetailScreen({super.key, required this.author});
  final AuthorModel author;

  @override
  State<AuthorDetailScreen> createState() => _AuthorDetailScreenState();
}

class _AuthorDetailScreenState extends State<AuthorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "${widget.author.firstname} ${widget.author.name}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                  child: AuthorBooksTile(
                    title: "Le roi et sa chèvre",
                    subtitle: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: const [
                          TextSpan(
                              text:
                                  "Livre de 124 pages, écrit le 15 fevrier 1950 dans "),
                          TextSpan(
                              text: "sous l'orage",
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

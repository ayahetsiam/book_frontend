import 'package:flutter/material.dart';

class AuthorTile extends StatelessWidget {
  const AuthorTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      leading: const Icon(Icons.person_3_outlined),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Auteur de 1 livre(s)",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.blue, // Replace with your color
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red, // Replace with your color
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.read_more,
                color: Colors.green, // Replace with your color
              ),
            ),
          ],
        )
      ],
    );
  }
}

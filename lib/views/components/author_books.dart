import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class AuthorBooksTile extends StatelessWidget {
  const AuthorBooksTile(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final Text subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.book_outlined),
            const Gap(16),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle,
              ],
            )),
          ],
        ));
  }
}

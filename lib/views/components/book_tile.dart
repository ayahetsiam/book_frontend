import 'package:book_ui/views/configs/colors.dart';
import 'package:book_ui/views/configs/style.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.book_outlined),
            const Gap(12),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppStyle.normalTextSize))),
                      Row(children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.edit_outlined,
                              color: AppColor.updateColor,
                            )),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.delete_outline,
                              color: AppColor.deleteColor,
                            )),
                      ]),
                    ],
                  ),
                  Text(subtitle)
                ],
              ),
            )
          ],
        ));
  }
}

import 'package:book_ui/views/configs/colors/light_theme_colors.dart';
import 'package:flutter/material.dart';

class BookTileShimmer extends StatelessWidget {
  const BookTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 75.0,
        decoration: BoxDecoration(
          color: AppColor.shimmerConponentColors,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

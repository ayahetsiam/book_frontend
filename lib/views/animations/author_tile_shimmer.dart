import 'package:book_ui/views/configs/colors/light_theme_colors.dart';
import 'package:flutter/material.dart';

class AuthorTileShimmer extends StatelessWidget {
  const AuthorTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 40.0,
        color: AppColor.shimmerConponentColors,
      ),
    );
  }
}

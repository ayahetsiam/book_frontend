import 'package:book_ui/views/route/app_router.dart';
import 'package:book_ui/views/configs/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightTheme(),
      debugShowCheckedModeBanner: false,
      routes: UiRoute.appRoute,
      initialRoute: '/',
      onUnknownRoute: ((settings) => UiRoute.appUnknowRoute),
    );
  }
}

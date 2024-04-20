import 'package:book_ui/configs/graphql_client.dart';
import 'package:book_ui/views/route/app_router.dart';
import 'package:book_ui/views/configs/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    GraphQLProvider(
      client: graphqlClient(
          "https://41be-2c0f-f0f8-69b-4d40-c91a-bd-d48b-904.ngrok-free.app/"),
      child: const MyApp(),
    ),
  );
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

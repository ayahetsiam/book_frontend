import 'package:book_ui/views/configs/colors.dart';
import 'package:book_ui/views/configs/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static var lightColorsScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primaryColor,
    onPrimary: AppColor.onPrimaryColor,
    secondary: AppColor.secondaryColor,
    error: Colors.red,
    background: Colors.white,
    surface: AppColor.surfaceColor,
    onSecondary: Colors.white,
    onSurface: AppColor.onSurfaceColor,
    onBackground: AppColor.onBackground,
    onError: Colors.white,
  );

  static const darkColorsScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.purple,
    onPrimary: Colors.black,
    secondary: Color.fromARGB(255, 67, 64, 69),
    error: Colors.red,
    background: Color.fromARGB(255, 28, 28, 28),
    surface: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.white,
    onError: Colors.white,
  );
  static ThemeData getLightTheme() {
    return ThemeData(
        colorScheme: lightColorsScheme,
        textTheme: const TextTheme(
            bodySmall: TextStyle(
                fontSize: AppStyle.normalTextSize,
                color: AppColor.onSurfaceColor)),
        dividerTheme: DividerThemeData(color: AppColor.secondaryColor),
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: AppColor.secondaryColor,
          collapsedIconColor: AppColor.onSurfaceColor,
          textColor: AppColor.secondaryColor,
          collapsedTextColor: AppColor.onSurfaceColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            hoverElevation: 32,
            foregroundColor: AppColor.onPrimaryColor,
            backgroundColor: AppColor.primaryColor),
        listTileTheme: ListTileThemeData(
            titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.onBackground),
            subtitleTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.onBackground),
            leadingAndTrailingTextStyle:
                const TextStyle(fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(backgroundColor: AppColor.primaryColor),
        tabBarTheme: TabBarTheme(
            unselectedLabelStyle: TextStyle(
                fontSize: AppStyle.tabSize, color: AppColor.onPrimaryColor),
            labelStyle: TextStyle(
                fontSize: AppStyle.selectedLabelSize,
                color: AppColor.onPrimaryColor)));
  }

  static ThemeData getDarkTheme() {
    return ThemeData(colorScheme: darkColorsScheme);
  }
}

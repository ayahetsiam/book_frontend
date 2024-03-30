import 'package:book_ui/views/configs/colors/dark_theme_colors.dart';
import 'package:book_ui/views/configs/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static var lightColorsScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primaryColor,
    onPrimary: AppColor.onPrimaryColor,
    secondary: AppColor.secondaryColor,
    error: AppColor.errorColor,
    background: AppColor.backgroundColor,
    surface: AppColor.surfaceColor,
    onSecondary: Colors.white,
    onSurface: AppColor.onSurfaceColor,
    onBackground: AppColor.onBackgroundColor,
    onError: AppColor.onErrorColor,
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
  static ThemeData getDarkTheme() {
    return ThemeData(
        colorScheme: lightColorsScheme,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
              fontSize: AppStyle.normalTextSize,
              color: AppColor.onSurfaceColor,
              fontWeight: AppStyle.normalTextFontWeight),
          titleMedium: TextStyle(
              fontSize: AppStyle.normalTextSize,
              color: AppColor.secondaryColor,
              fontWeight: AppStyle.titleFontWeight),
          bodySmall: const TextStyle(
              fontSize: AppStyle.smallTextSize,
              color: AppColor.onSurfaceColor,
              fontWeight: AppStyle.normalTextFontWeight),
          titleSmall: TextStyle(
              fontSize: AppStyle.smallTextSize,
              color: AppColor.secondaryColor,
              fontWeight: AppStyle.titleFontWeight),
          bodyLarge: const TextStyle(
              fontSize: AppStyle.largTextSize,
              color: AppColor.onSurfaceColor,
              fontWeight: AppStyle.normalTextFontWeight),
          titleLarge: TextStyle(
              fontSize: AppStyle.largTextSize,
              color: AppColor.secondaryColor,
              fontWeight: AppStyle.titleFontWeight),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColor.surfaceColor,
          contentTextStyle: const TextStyle(
              color: AppColor.onSurfaceColor,
              fontWeight: AppStyle.titleFontWeight),
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
          TextStyle(
              fontWeight: AppStyle.titleFontWeight,
              color: AppColor.primaryColor,
              fontSize: AppStyle.mediumTextSize),
        ))),
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
                color: AppColor.onBackgroundColor),
            subtitleTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.onBackgroundColor),
            leadingAndTrailingTextStyle:
                const TextStyle(fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: AppColor.onPrimaryColor),
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide(
            color: AppColor.secondaryColor,
            style: BorderStyle.solid,
          ),
          labelStyle: TextStyle(
              color: AppColor.secondaryColor,
              fontWeight: AppStyle.titleFontWeight,
              fontSize: AppStyle.mediumTextSize),
          hintStyle: const TextStyle(fontSize: AppStyle.normalTextSize),
        ),
        tabBarTheme: TabBarTheme(
            unselectedLabelStyle: TextStyle(
                fontSize: AppStyle.tabSize, color: AppColor.onPrimaryColor),
            labelStyle: TextStyle(
                fontSize: AppStyle.selectedLabelSize,
                color: AppColor.onPrimaryColor)));
  }
}

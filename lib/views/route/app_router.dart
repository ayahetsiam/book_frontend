import 'package:book_ui/views/screen/add_author_screen.dart';
import 'package:book_ui/views/screen/add_book_screen.dart';
import 'package:book_ui/views/screen/author_books_screen.dart';
import 'package:book_ui/views/screen/main_screem.dart';
import 'package:book_ui/views/screen/modify_author_screen.dart';
import 'package:book_ui/views/screen/modify_book_screen.dart';
import 'package:book_ui/views/screen/research_screen.dart';
import 'package:book_ui/views/screen/setting_screen.dart';
import 'package:book_ui/views/screen/unknow_screen.dart';
import 'package:flutter/material.dart';

class UiRoute {
  static final appRoute = {
    "/": (context) => const MainScreen(),
    "addAuthor": (context) => const AddAuthorScreen(),
    "addBook": (context) => const AddBookScreen(),
    "modifyAuthor": (context) => const ModifyAuthorScreen(),
    "modifyBook": (context) => const ModifyBookScreen(),
    "authorBooks": (context) => const AuthorDetailScreen(),
    "setting": (context) => const SettingScreen(),
    "research": (context) => const ResearchScreen(),
  };

  static final appUnknowRoute = MaterialPageRoute(
    builder: (context) => const UnknowScreen(),
  );
}

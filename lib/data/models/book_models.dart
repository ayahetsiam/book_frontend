import 'package:book_ui/data/models/author_model.dart';

class BookModel {
  String isbn;
  String title;
  String artwork;
  int page;
  String writtenAt;
  AuthorModel author;

  BookModel({
    required this.isbn,
    required this.title,
    required this.artwork,
    required this.page,
    required this.writtenAt,
    required this.author,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      isbn: json["isbn"] as String,
      title: json["title"] as String,
      artwork: json["artwork"] as String,
      page: json["page"] as int,
      writtenAt: json["writtenAt"] as String,
      author: AuthorModel.fromJson(json["author"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isbn": isbn,
      "title": title,
      "artwork": artwork,
      "page": page,
      "writtenAt": writtenAt,
      "author": author.toJson(),
    };
  }
}

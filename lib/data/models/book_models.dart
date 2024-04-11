class BookModel {
  String id;
  String isbn;
  String title;
  String artwork;
  int page;
  String writtenAt;
  String author;

  BookModel({
    required this.isbn,
    required this.title,
    required this.artwork,
    required this.page,
    required this.writtenAt,
    required this.author,
    required this.id,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["_id"] as String,
      isbn: json["ISBN"] as String,
      title: json["title"] as String,
      artwork: json["artwork"] as String,
      page: json["page"] as int,
      writtenAt: json["writtenAt"] as String,
      author: json["author"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "ISBN": isbn,
      "title": title,
      "artwork": artwork,
      "page": page,
      "writtenAt": writtenAt,
      "author": author,
    };
  }
}

class BookEndPoint{
  static const String getBooksQuery = """query{books{_id ISBN title artwork page author writtenAt}}""";

  static const String getBookByAuthorQuery =
      """query getBookByAuthorQuery(\$authorid:ID!){authorsBooks(author_id:\$authorid){
        _id ISBN title artwork page author writtenAt}}
      """;
}
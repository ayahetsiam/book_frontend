const String getBooks =
    """query{books{_id ISBN title artwork page author writtenAt}}""";
const String getBookByAuthorQuery =
    """query getBookByAuthorQuery(\$authorid:ID!){authorsBooks(author_id:\$authorid){_id ISBN title artwork page author writtenAt}}""";

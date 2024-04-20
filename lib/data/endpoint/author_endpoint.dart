class AuthorEndPoint {
  static const String getAuthorsQuery =
      """query{authors{_id name, firstName}}""";

  static const String getAuthorByIdQuery = """
  query getAuthorById(\$authorId: ID!) {
    author(key: \$authorId) {
      _id,
      name,
      firstName,
    }}
  """;

//Mutation
  static const String updateAuthorMutation = """
  mutation updateAuthorMutation(\$key:ID!, \$name:String, \$firstName:String){
    updateAuthor(key:\$key, name: \$name, firstName:\$firstName){
      _id,
      name,
      firstName,
    }}
""";

  static const String createAuthorMutation = """
  mutation createAuthorMutation(\$name:String!, \$firstName:String!){
    createAuthor(name: \$name, firstName:\$firstName){
      _id,
      name,
      firstName,
    }}
""";

  static const String deleteAuthorMutation = """
  mutation deleteAuthorMutation(\$key:ID!){
    deleteAuthor(key:\$key)}""";
}

const String getAuthorsQuery = """query{authors{_id name, firstName}}""";
const String getAuthorByIdQuery = """
  query getAuthorById(\$authorId: ID!) {
    author(key: \$authorId) {
      _id,
      name,
      firstName,
    }}
  """;
//Mutation

const String updateAuthorMutation = """
mutation updateAuthorMutation(\$key:ID!, \$name:String, \$firstname:String){
  updateAuthor(key:\$key, name: \$name, firstName:\$firstname){
    _id,
    name,
    firstName,
  }}
""";

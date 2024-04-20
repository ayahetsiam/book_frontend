import 'package:book_ui/data/endpoint/author_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthorMutation {

  static Future<QueryResult> createMutation({
    required BuildContext context,
    required Map<String, dynamic> author,
  }) async {
    return await GraphQLProvider.of(context).value.mutate(
          MutationOptions(
            document: gql(AuthorEndPoint.createAuthorMutation),
            variables: author,
          ),
        );
  }

  static Future<QueryResult> updateMutation({
    required BuildContext context,
    required Map<String, dynamic> variables,
  }) async {
    return await GraphQLProvider.of(context).value.mutate(
          MutationOptions(
            document: gql(AuthorEndPoint.updateAuthorMutation),
            variables: variables,
          ),
        );
  }

  static Future<QueryResult> deleteMutation({
    required BuildContext context,
    required String authorKey,
  }) async {
    return await GraphQLProvider.of(context).value.mutate(
          MutationOptions(
            document: gql(AuthorEndPoint.deleteAuthorMutation),
            variables: {"key": authorKey},
          ),
        );
  }
}

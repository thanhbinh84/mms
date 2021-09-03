import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/io_client.dart';
import 'package:mms/common/local.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';

const ACCESS_POINT = 'https://api.github.com/graphql';

abstract class BaseAPI {
  Future<List<GraphqlApi$Query$Repository$Issues$Edges?>?> getIssues();
}

class API extends BaseAPI {
  static final API instance = new API._internal();
  late GraphQLClient _graphQLClient;

  factory API() {
    return instance;
  }

  API._internal() {
    final HttpLink link = HttpLink(ACCESS_POINT, httpClient: IOClient(HttpClient()));
    final AuthLink authLink = AuthLink(
        getToken: () => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN'
    );

    final policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );

    _graphQLClient = GraphQLClient(
        cache: GraphQLCache(),
        link: authLink.concat(link),
        defaultPolicies: DefaultPolicies(
          watchQuery: policies,
          query: policies,
          mutate: policies,
        ));
  }

  Future<List<GraphqlApi$Query$Repository$Issues$Edges?>?> getIssues() async {
    QueryOptions queryOptions = QueryOptions(document: GraphqlApiQuery().document);
    QueryResult result = await _graphQLClient.query(queryOptions);
    return GraphqlApi$Query.fromJson(result.data).repository!.issues.edges!.reversed.toList();
  }
}
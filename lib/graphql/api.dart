// ignore: import_of_legacy_library_into_null_safe
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:mms/common/local.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';

const ACCESS_POINT = 'https://api.github.com/graphql';

abstract class BaseAPI {
  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria);
}

class API extends BaseAPI {
  static final API instance = new API._internal();
  late GraphQLClient _graphQLClient;

  factory API() {
    return instance;
  }

  API._internal() {
    final HttpLink link = HttpLink(ACCESS_POINT, httpClient: IOClient(HttpClient()));
    final AuthLink authLink = AuthLink(getToken: () => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN');

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

  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria) async {
    var arg = GraphqlApiArguments(
        fetchMoreCursor: issueList.endCursor,
        state: issueCriteria.status.arguments,
        field: issueCriteria.sortBy.field,
        direction: issueCriteria.sortBy.direction);
    QueryOptions queryOptions =
        QueryOptions(document: GraphqlApiQuery(variables: arg).document, variables: arg.toJson());
    Map<String,dynamic> data = await _handleResponse(_graphQLClient.query(queryOptions));
    issueList.updateData(GraphqlApi$Query.fromJson(data).repository!.issues);
    return issueList;
  }

  Future _handleResponse(Future<QueryResult> request) async {
    QueryResult result = await request;

    if (result.hasException) {
      String message = result.exception.graphqlErrors.isNotEmpty
          ? result.exception.graphqlErrors.first.message
          : result.exception.linkException.toString();
      throw Exception(message);
    }
    return result.data;
  }
}

import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:mms/common/local.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/remote/graphql/graphql_api.dart';

const ACCESS_POINT = 'https://api.github.com/graphql';

abstract class BaseAPI {
  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria);

  Future<Issue> getIssueDetails(Issue issue);
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
    var arg = IssuesArguments(
        fetchMoreCursor: issueList.endCursor,
        state: issueCriteria.status.arguments,
        field: issueCriteria.sortBy.field,
        direction: issueCriteria.sortBy.direction);
    QueryOptions queryOptions =
        QueryOptions(document: IssuesQuery(variables: arg).document, variables: arg.toJson());
    Map<String, dynamic> data = await _handleResponse(_graphQLClient.query(queryOptions));
    return IssueList.fromJson(Issues$Query.fromJson(data).repository!.issues);;
  }

  @override
  Future<Issue> getIssueDetails(Issue issue) async {
    var arg = IssueArguments(number: issue.number);
    QueryOptions queryOptions =
        QueryOptions(document: IssueQuery(variables: arg).document, variables: arg.toJson());
    Map<String, dynamic> data = await _handleResponse(_graphQLClient.query(queryOptions));
    issue.updateData(Issue$Query.fromJson(data).repository!.issue);
    return issue;
  }

  Future _handleResponse(Future<QueryResult> request) async {
    QueryResult result = await request;

    if (result.hasException) {
      String message = '';
      LinkException? linkException = result.exception!.linkException;
      if (linkException == null)
        message = result.exception!.graphqlErrors.first.message;
      else if (linkException is ServerException) {
        ServerException? serverException = result.exception!.linkException as ServerException;
        if (serverException.originalException is SocketException)
          message = 'Cannot reach server';
        else
          message = serverException.parsedResponse?.errors?.first.message ?? '';
      }
      if (message.isEmpty) message = 'Something went wrong';

      throw Exception(message);
    }
    return result.data;
  }
}

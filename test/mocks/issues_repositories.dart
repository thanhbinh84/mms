import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/remote/graphql/api.dart';
import 'package:mms/data/remote/graphql/graphql_api.graphql.dart';

class MockAPI extends BaseAPI {
  final results = QueryResult(
    data: decodeIssuesResponse,
    exception: null,
    source: QueryResultSource.network,
  );

  @override
  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria) async {
    return IssueList.fromJson(Issues$Query.fromJson(decodeIssuesResponse['data']).repository!.issues);
  }

  @override
  Future<Issue> getIssueDetails(Issue issue) {
    throw UnimplementedError();
  }
}

const data = """
{
  "data": {
    "repository": {
      "issues": {
        "edges": [
          {
            "node": {
              "databaseId": 136854365,
              "title": "Cascading menus",
              "url": "https://github.com/flutter/flutter/issues/2242",
              "closed": false,
              "number": 2242,
              "createdAt": "2016-02-27T00:42:18Z",
              "comments": {
                "totalCount": 0
              }
            }
          },
          {
            "node": {
              "databaseId": 138880173,
              "title": "We should document font-family mapping conventions",
              "url": "https://github.com/flutter/flutter/issues/2458",
              "closed": false,
              "number": 2458,
              "createdAt": "2016-02-27T00:42:18Z",
              "comments": {
                "totalCount": 0
              }
            }
          }
        ],
        "pageInfo": {
          "endCursor": "Y3Vyc29yOnYyOpIAzghHJK0=",
          "hasNextPage": true
        }
      }
    }
  }
}
""";

Map<String, dynamic> decodeIssuesResponse = jsonDecode(data);

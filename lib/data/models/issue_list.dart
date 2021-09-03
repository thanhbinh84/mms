import 'package:mms/graphql/graphql_api.graphql.dart';

class Issue {
  String? title;
  String? url;
  int? id;

  Issue({this.title, this.id});

  Issue.fromEdge(GraphqlApi$Query$Repository$Issues$Edges edge) {
    this.title = edge.node!.title;
    this.url = edge.node!.url;
    this.id = edge.node!.databaseId;
  }

  static const KEY_ID = 'ID';

  Issue.fromJson(Map jsonData) {
    id = jsonData[KEY_ID];
  }

  Map<String, dynamic> toJson() => {KEY_ID: id};
}

class IssueList {
  List<Issue> currentList = [];
  String? endCursor;
  bool hasNextPage = false;

  IssueList();

  updateData(GraphqlApi$Query$Repository$Issues issues) {
    currentList.addAll(issues.edges!.map((edge) => Issue.fromEdge(edge!)));
    hasNextPage = issues.pageInfo.hasNextPage;
    endCursor = issues.pageInfo.endCursor;
  }
}

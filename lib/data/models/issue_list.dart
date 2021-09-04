import 'package:equatable/equatable.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';

class Issue extends Equatable {
  String? title;
  String? url;
  int? id;
  bool isVisited = false;
  bool closed = false;
  int? number;

  Issue({this.title, this.id});

  Issue.fromEdge(GraphqlApi$Query$Repository$Issues$Edges edge) {
    this.title = edge.node!.title;
    this.url = edge.node!.url;
    this.id = edge.node!.databaseId;
    this.closed = edge.node!.closed;
    this.number = edge.node!.number;
  }

  static const KEY_ID = 'ID';

  Issue.fromJson(Map jsonData) {
    id = jsonData[KEY_ID];
  }

  Map<String, dynamic> toJson() => {KEY_ID: id};

  @override
  List<Object?> get props => [id];
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

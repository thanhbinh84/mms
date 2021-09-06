import 'package:equatable/equatable.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';

class Issue extends Equatable {
  String? title;
  String? url;
  int? id;
  bool isVisited = false;
  bool closed = false;
  int number = 0;
  int totalComments = 0;
  DateTime createdDate = DateTime.now();
  Author author = Author();
  String? bodyHTML;

  Issue({this.title, this.id});

  Issue.fromNode(Issues$Query$Repository$Issues$Edges$Node? node) {
    if (node == null) return;
    this.title = node.title;
    this.url = node.url;
    this.id = node.databaseId;
    this.closed = node.closed;
    this.number = node.number;
    this.createdDate = node.createdAt;
    this.totalComments = node.comments.totalCount;
  }

  static const KEY_ID = 'ID';

  Issue.fromJson(Map jsonData) {
    id = jsonData[KEY_ID];
  }

  Map<String, dynamic> toJson() => {KEY_ID: id};

  updateData(Issue$Query$Repository$Issue? issue) {
    if (issue == null) return;
    author = Author.fromJson(issue.author);
    bodyHTML = issue.bodyHTML;
  }

  @override
  List<Object?> get props => [id];

  get duration {
    DateTime now = DateTime.now();
    int duration = now.year - createdDate.year;
    if (duration > 0)
      return '$duration y';
    duration = now.month - createdDate.month;
    if (duration > 0)
      return '$duration mo';
    duration = now.day - createdDate.day;
    if (duration > 0)
      return '$duration d';
    Duration difference = now.difference(createdDate);
    duration = difference.inHours;
    if (duration > 0)
      return '$duration h';
    duration = difference.inMinutes;
    return '$duration m';
  }
}

class Author {
  String avatarUrl = '';
  String userName = '';

  Author({this.avatarUrl = '', this.userName = ''});

  Author.fromJson(Issue$Query$Repository$Issue$Author? author) {
    if (author == null) return;
    this.avatarUrl = author.avatarUrl;
    this.userName = author.login;
  }
}

class IssueList {
  List<Issue> currentList = [];
  String? endCursor;
  bool hasNextPage = false;

  IssueList();

  updateData(Issues$Query$Repository$Issues issues) {
    if (issues.edges != null)
      currentList.addAll(issues.edges!.map((edge) => Issue.fromNode(edge!.node)));
    hasNextPage = issues.pageInfo.hasNextPage;
    endCursor = issues.pageInfo.endCursor;
  }
}

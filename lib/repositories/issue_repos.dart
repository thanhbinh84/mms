import 'package:mms/graphql/graphql_api.dart';
import 'package:mms/graphql/api.dart';

abstract class BaseIssueRepository {
  Future<List<GraphqlApi$Query$Repository$Issues$Edges?>?> getIssues();
}

class IssueRepository extends BaseIssueRepository {
  final BaseAPI api;
  IssueRepository({required this.api});

  Future<List<GraphqlApi$Query$Repository$Issues$Edges?>?> getIssues() async {
    return api.getIssues();
  }
}

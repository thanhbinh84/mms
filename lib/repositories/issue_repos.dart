import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/graphql/api.dart';

abstract class BaseIssueRepository {
  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria);
}

class IssueRepository extends BaseIssueRepository {
  final BaseAPI api;
  IssueRepository({required this.api});

  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria) async {
    return api.getIssues(issueList, issueCriteria);
  }
}

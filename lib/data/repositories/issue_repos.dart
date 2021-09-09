import 'package:mms/data/local/storage.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/remote/graphql/api.dart';

abstract class BaseIssueRepository {
  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria);
  Future<Issue> getIssueDetails(Issue issue);
  Set<Issue> getVisitedIssues();
  setVisitedIssues(Set<Issue> visitedIssues);
}

class IssueRepository extends BaseIssueRepository {
  final BaseAPI api;
  IssueRepository({required this.api});

  Future<IssueList> getIssues(IssueList issueList, IssueCriteria issueCriteria) {
    return api.getIssues(issueList, issueCriteria);
  }

  @override
  Set<Issue> getVisitedIssues() {
    return Storage.instance.getVisitedIssues();
  }

  @override
   setVisitedIssues(Set<Issue> visitedIssues) {
    Storage.instance.setVisitedIssues(visitedIssues);
  }

  @override
  Future<Issue> getIssueDetails(Issue issue) async {
    return api.getIssueDetails(issue);
  }
}

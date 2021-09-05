import 'package:flutter_test/flutter_test.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/repositories/issue_repos.dart';

import '../mocks/issues_repositories.dart';


void main() {
  var api = MockAPI();

  test('Issue repositories get correct data', () async {
    var repo = IssueRepository(api: api);
    IssueList issueList = await repo.getIssues(IssueList(), IssueCriteria());

    expect(issueList.currentList.length, 2);
    expect(issueList.endCursor, "Y3Vyc29yOnYyOpIAzghHJK0=");
    expect(issueList.hasNextPage, true);

    Issue issue = issueList.currentList.first;
    expect(issue.id, 136854365);
    expect(issue.title, 'Cascading menus');
    expect(issue.url, 'https://github.com/flutter/flutter/issues/2242');
    expect(issue.closed, false);
    expect(issue.number, 2242);
  });
}
import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/repositories/issue_repos.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final BaseIssueRepository issueRepository;
  IssueList _issueList = IssueList();
  Set<Issue> _visitedIssue = Set();

  IssuesCubit({
    required this.issueRepository,
  }) : super(IssuesState());

  getIssues(IssueCriteria issueCriteria, {bool loadMore = false}) async {
    try {
      emit(loadMore ? IssuesLoadMore(issueList: _issueList) : IssuesLoading());
      _issueList = await issueRepository.getIssues(loadMore ? _issueList : IssueList(), issueCriteria);
      _visitedIssue = issueRepository.getVisitedIssues();
      _issueList.currentList.where((issue) => _visitedIssue.contains(issue)).forEach((issue) {
        issue.isVisited = true;
      });
      emit(IssuesLoaded(issueList: _issueList));
    } catch (e) {
      emit(IssuesFailure(error: e.toString()));
    }
  }

  addVisitedIssue(Issue issue) {
    emit(IssuesLoading());
    _visitedIssue.add(issue);
    issueRepository.setVisitedIssues(_visitedIssue);
    _issueList.currentList.firstWhere((element) => element == issue).isVisited = true;
    emit(IssuesLoaded(issueList: _issueList));
  }
}

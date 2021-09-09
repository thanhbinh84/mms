import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/repositories/issue_repos.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final BaseIssueRepository issueRepository;
  Set<Issue> _visitedIssue = Set();

  IssuesCubit({required this.issueRepository}) : super(IssuesInitial());

  getIssues({bool loadMore = false, SortBy? sortBy, Status? status}) async {
    try {
      IssueList _issueList = IssueList();
      IssueCriteria _issueCriteria = IssueCriteria();

      if (state is IssuesLoadSuccess) {
        IssuesLoadSuccess issuesLoaded = state as IssuesLoadSuccess;
        if (loadMore)
          _issueList = issuesLoaded.issueList;
        _issueCriteria = issuesLoaded.issueCriteria;
      }

      if (sortBy != null) _issueCriteria.sortBy = sortBy;
      if (status != null) _issueCriteria.status = status;

      if (!loadMore) emit(IssuesLoadInProgress());

      IssueList newIssueList = await issueRepository.getIssues(_issueList, _issueCriteria);
      _visitedIssue = issueRepository.getVisitedIssues();
      newIssueList.currentList.where((issue) => _visitedIssue.contains(issue)).forEach((issue) {
        issue.isVisited = true;
      });
      newIssueList.currentList.insertAll(0, _issueList.currentList);
      emit(IssuesLoadSuccess(issueList: newIssueList, issueCriteria: _issueCriteria));
    } catch (e) {
      emit(IssuesFailure(e.toString()));
    }
  }

  addVisitedIssue(Issue issue) {
    if (_visitedIssue.contains(issue)) return;
    _visitedIssue.add(issue);
    issueRepository.setVisitedIssues(_visitedIssue);
    if (state is IssuesLoadSuccess) {
      IssuesLoadSuccess issuesLoaded = state as IssuesLoadSuccess;
      issuesLoaded.issueList.currentList
          .firstWhere((element) => element == issue)
          .isVisited = true;
      emit(IssuesLoadInProgress()); // force reload
      emit(IssuesLoadSuccess(issueList: issuesLoaded.issueList, issueCriteria: issuesLoaded.issueCriteria));
    }
  }
}



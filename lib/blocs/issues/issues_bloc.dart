import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/repositories/issue_repos.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final BaseIssueRepository issueRepository;
  IssueList _issueList = IssueList();
  IssueCriteria _issueCriteria = IssueCriteria();
  Set<Issue> _visitedIssue = Set();

  IssuesCubit({
    required this.issueRepository,
  }) : super(IssuesState(IssueList(), IssueCriteria()));

  getIssues({bool loadMore = false, SortBy? sortBy, Status? status}) async {
    try {
      if (!loadMore || sortBy != null || status != null) _issueList = IssueList();
      emit(IssuesLoading(_issueList, _issueCriteria));
      if (sortBy != null) _issueCriteria.sortBy = sortBy;
      if (status != null) _issueCriteria.status = status;

      _issueList = await issueRepository.getIssues(_issueList, _issueCriteria);
      _visitedIssue = issueRepository.getVisitedIssues();
      _issueList.currentList.where((issue) => _visitedIssue.contains(issue)).forEach((issue) {
        issue.isVisited = true;
      });
      emit(IssuesLoaded(_issueList, _issueCriteria));
    } catch (e) {
      emit(IssuesFailure(_issueList, _issueCriteria, error: e.toString()));
    }
  }

  addVisitedIssue(Issue issue) {
    if (_visitedIssue.contains(issue)) return;
    emit(IssuesLoading(_issueList, _issueCriteria));
    _visitedIssue.add(issue);
    issueRepository.setVisitedIssues(_visitedIssue);
    _issueList.currentList.firstWhere((element) => element == issue).isVisited = true;
    emit(IssuesLoaded(_issueList, _issueCriteria));
  }
}

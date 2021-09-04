import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/repositories/issue_repos.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final BaseIssueRepository issueRepository;

  IssuesCubit({
    required this.issueRepository,
  }) : super(InitialIssueState());

  getIssues(IssueList issueList, IssueCriteria issueCriteria) async {
    try {
      emit(IssuesLoading());
      IssueList issues = await issueRepository.getIssues(issueList, issueCriteria);
      emit(IssuesLoaded(issues: issues));
    } catch (e) {
      emit(IssuesError(error: e.toString()));
      rethrow;
    }
  }
}

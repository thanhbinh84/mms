import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issue/issue_states.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/repositories/issue_repos.dart';

class IssueCubit extends Cubit<IssueState> {
  final BaseIssueRepository issueRepository;
  IssueCubit({required this.issueRepository}) : super(IssueState());

  getIssue(Issue issue) async {
    try {
      emit(IssueLoading());
      emit(IssueLoaded(issue: await issueRepository.getIssueDetails(issue)));
    } catch (e) {
      emit(IssueFailure(error: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';
import 'package:mms/repositories/issue_repos.dart';

class IssuesCubit extends Cubit<IssuesState> {
  final BaseIssueRepository issueRepository;

  IssuesCubit({
    required this.issueRepository,
  }) : super(InitialIssueState());

  getIssues() async {
    List<GraphqlApi$Query$Repository$Issues$Edges?>? issues = await issueRepository.getIssues();
    emit(issues == null ? IssuesError(error: 'Something went wrong') : IssuesLoaded(issues: issues));
  }
}

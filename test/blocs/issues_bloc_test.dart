// @dart=2.9
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mms/blocs/issues/issues_cubit.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/data/repositories/issue_repos.dart';
import 'package:mockito/mockito.dart';

class MockIssueRepository extends Mock implements IssueRepository {}

void main() {
  group('IssuesCubit', () {
    IssuesCubit issuesCubit;
    MockIssueRepository issueRepository;
    var issueList = IssueList();

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      issueRepository = MockIssueRepository();
      issuesCubit = IssuesCubit(issueRepository: issueRepository);
    });

    blocTest(
      'success case',
      build: () => issuesCubit,
      act: (IssuesCubit bloc) {
        when(issueRepository.getIssues(any, any)).thenAnswer((_) => Future.value(issueList));
        bloc.getIssues();
      },
      expect: () => [isA<IssuesLoadInProgress>(),  isA<IssuesLoadSuccess>()],
    );

    blocTest(
      'failure case',
      build: () => issuesCubit,
      act: (IssuesCubit bloc) {
        when(issueRepository.getIssues(any, any)).thenThrow(Exception());
        bloc.getIssues();
      },
      expect: () => [isA<IssuesLoadInProgress>(),  isA<IssuesFailure>()],
    );
  });
}

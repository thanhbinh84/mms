import 'package:equatable/equatable.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';

class IssuesState extends Equatable {
  final IssueList issueList;
  final IssueCriteria issueCriteria;
  final String error;

  const IssuesState(this.issueList, this.issueCriteria, {this.error = ''});

  List<Object?> get props => [issueList, this.issueCriteria, this.error];
}

class InitialIssueState extends IssuesState {
  const InitialIssueState(issueList, issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'InitialIssueState';
}

class IssuesLoading extends IssuesState {
  const IssuesLoading(issueList, issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'IssuesLoading';
}

class IssuesLoaded extends IssuesState {
  const IssuesLoaded(issueList, issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'IssuesLoaded ${issueList.currentList.length}';
}

class IssuesFailure extends IssuesState {
  const IssuesFailure(issueList, issueCriteria, {error})
      : super(issueList, issueCriteria, error: error);

  @override
  String toString() => 'IssuesError $error';
}

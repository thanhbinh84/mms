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
  final IssueList issueList;
  final IssueCriteria issueCriteria;

  const InitialIssueState(this.issueList, this.issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'InitialIssueState';
}

class IssuesLoading extends IssuesState {
  final IssueList issueList;
  final IssueCriteria issueCriteria;

  const IssuesLoading(this.issueList, this.issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'IssuesLoading';
}

class IssuesLoaded extends IssuesState {
  final IssueList issueList;
  final IssueCriteria issueCriteria;

  const IssuesLoaded(this.issueList, this.issueCriteria) : super(issueList, issueCriteria);

  @override
  String toString() => 'IssuesLoaded ${issueList.currentList.length}';
}

class IssuesFailure extends IssuesState {
  final IssueList issueList;
  final IssueCriteria issueCriteria;
  final String error;

  const IssuesFailure(this.issueList, this.issueCriteria, {this.error = ''})
      : super(issueList, issueCriteria, error: error);

  @override
  String toString() => 'IssuesError $error';
}

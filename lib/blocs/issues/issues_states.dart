import 'package:equatable/equatable.dart';
import 'package:mms/data/models/issue_list.dart';

class IssuesState extends Equatable {
  final List<Object?>? objProps;
  const IssuesState([this.objProps]);

  List<Object?> get props => objProps ?? [];
}

class InitialIssueState extends IssuesState {}

class IssuesLoading extends IssuesState {
  @override
  String toString() => 'IssuesLoading';
}

class BaseIssueLoaded extends IssuesState {
  final IssueList issueList;
  BaseIssueLoaded({required this.issueList}) : super([issueList]);
}

class IssuesLoadMore extends BaseIssueLoaded {
  final IssueList issueList;
  IssuesLoadMore({required this.issueList}) : super(issueList: issueList);

  @override
  String toString() => 'IssuesLoadMore ${issueList.currentList.length}';
}

class IssuesLoaded extends BaseIssueLoaded {
  final IssueList issueList;
  IssuesLoaded({required this.issueList}) : super(issueList: issueList);

  @override
  String toString() => 'IssuesLoaded ${issueList.currentList.length}';
}

class AuthenticationUnauthenticated extends IssuesState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class IssuesFailure extends IssuesState {
  final String error;
  IssuesFailure({required this.error}) : super([error]);

  @override
  String toString() => 'IssuesError $error';
}

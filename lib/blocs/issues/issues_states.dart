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

class IssuesLoaded extends IssuesState {
  final IssueList issues;
  IssuesLoaded({required this.issues}) : super([issues]);

  @override
  String toString() => 'IssuesLoaded ${issues.currentList.length}';
}

class AuthenticationUnauthenticated extends IssuesState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class IssuesError extends IssuesState {
  final String error;
  IssuesError({required this.error}) : super([error]);

  @override
  String toString() => 'IssuesError $error';
}

import 'package:equatable/equatable.dart';
import 'package:mms/data/models/issue_list.dart';

class IssueState extends Equatable {
  final List<Object?>? objProps;
  const IssueState([this.objProps]);

  List<Object?> get props => objProps ?? [];
}

class IssueLoadInProgress extends IssueState {
  @override
  String toString() => 'IssueLoadInProgress';
}

class IssueLoadSuccess extends IssueState {
  final Issue issue;

  IssueLoadSuccess({required this.issue}) : super([issue]);

  @override
  String toString() => 'IssueLoadSuccess $issue';
}

class IssueFailure extends IssueState {
  final String error;

  IssueFailure({required this.error}) : super([error]);

  @override
  String toString() => 'IssueFailure $error';
}

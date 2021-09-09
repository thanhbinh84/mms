import 'package:equatable/equatable.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';

abstract class IssuesState extends Equatable {
  final List<Object?>? objProps;
  const IssuesState([this.objProps]);

  List<Object?> get props => objProps ?? [];
}

class IssuesInitial extends IssuesState {
  @override
  String toString() => 'IssuesInitial';
}

class IssuesLoadInProgress extends IssuesState {
  @override
  String toString() => 'IssuesLoadInProgress';
}

class IssuesLoadSuccess extends IssuesState {
  final IssueList issueList;
  final IssueCriteria issueCriteria;

  IssuesLoadSuccess({required this.issueList,  required this.issueCriteria}) : super([issueList, issueCriteria]);

  @override
  String toString() => 'IssuesLoaded ${issueList.currentList.length}';
}

class IssuesFailure extends IssuesState {
  final String error;
  IssuesFailure(this.error) : super([error]);

  @override
  String toString() => 'IssuesFailure $error';
}



import 'package:mms/data/remote/graphql/graphql_api.graphql.dart';

class IssueCriteria {
  Status status;
  SortBy sortBy;

  IssueCriteria({this.status = Status.Open, this.sortBy = SortBy.Newest});
}

class Status {
  final argument, name;

  const Status._internal(this.argument, this.name);

  toString() => name;

  static const Open = const Status._internal(IssueState.open, 'Open');
  static const Closed = const Status._internal(IssueState.closed, 'Closed');
  static const All = const Status._internal(IssueState.artemisUnknown, 'All');

  List<IssueState> get arguments => this == All ? [Open.argument, Closed.argument] : [this.argument];

  static get list => [Open, Closed, All];
}

class SortBy {
  final field, direction, name;

  const SortBy._internal(this.field, this.direction, this.name);

  toString() => name;

  static const Newest = const SortBy._internal(IssueOrderField.createdAt, OrderDirection.desc, 'Newest');
  static const Oldest = const SortBy._internal(IssueOrderField.createdAt, OrderDirection.asc, 'Oldest');
  static const MostCommented = const SortBy._internal(
      IssueOrderField.comments, OrderDirection.desc, 'Most Commented');
  static const LeastCommented = const SortBy._internal(
      IssueOrderField.comments, OrderDirection.asc, 'Least Commented');

  List<IssueState> get arguments => [this.field];

  static get list => [Newest, Oldest, MostCommented, LeastCommented];
}

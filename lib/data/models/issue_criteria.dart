import 'package:mms/graphql/graphql_api.dart';

class IssueCriteria {
  Status status;
  SortBy sortBy;

  IssueCriteria({this.status = Status.Open, this.sortBy = SortBy.Newest});
}

class Status {
  final argument, name;

  const Status._internal(this.argument, this.name);

  toString() => 'Enum.$name';

  static const Open = const Status._internal(IssueState.open, 'Open');
  static const Closed = const Status._internal(IssueState.closed, 'Closed');
  static const All = const Status._internal(IssueState.artemisUnknown, 'All');

  List<IssueState> get arguments => [this.argument];

  static get list => [Open, Closed, All];
}

class SortBy {
  final field, direction, name;

  const SortBy._internal(this.field, this.direction, this.name);

  toString() => 'Enum.$name';

  static const Newest = const SortBy._internal(IssueOrderField.createdAt, OrderDirection.desc, 'Newest');
  static const Oldest = const SortBy._internal(IssueOrderField.createdAt, OrderDirection.asc, 'Oldest');
  static const MostCommented = const SortBy._internal(
      IssueOrderField.comments, OrderDirection.desc, 'Most Commented');
  static const LeastCommented = const SortBy._internal(
      IssueOrderField.comments, OrderDirection.asc, 'Least Commented');

  List<IssueState> get arguments => [this.field];

  static get list => [Newest, Oldest, MostCommented, LeastCommented];
}

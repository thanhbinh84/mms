// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository$Issues$Edges$Node$Comments
    extends JsonSerializable with EquatableMixin {
  Issues$Query$Repository$Issues$Edges$Node$Comments();

  factory Issues$Query$Repository$Issues$Edges$Node$Comments.fromJson(
          Map<String, dynamic> json) =>
      _$Issues$Query$Repository$Issues$Edges$Node$CommentsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$Issues$Query$Repository$Issues$Edges$Node$CommentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository$Issues$Edges$Node extends JsonSerializable
    with EquatableMixin {
  Issues$Query$Repository$Issues$Edges$Node();

  factory Issues$Query$Repository$Issues$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$Issues$Query$Repository$Issues$Edges$NodeFromJson(json);

  int? databaseId;

  late String title;

  late String url;

  late bool closed;

  late int number;

  late DateTime createdAt;

  late Issues$Query$Repository$Issues$Edges$Node$Comments comments;

  @override
  List<Object?> get props =>
      [databaseId, title, url, closed, number, createdAt, comments];
  @override
  Map<String, dynamic> toJson() =>
      _$Issues$Query$Repository$Issues$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository$Issues$Edges extends JsonSerializable
    with EquatableMixin {
  Issues$Query$Repository$Issues$Edges();

  factory Issues$Query$Repository$Issues$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$Issues$Query$Repository$Issues$EdgesFromJson(json);

  Issues$Query$Repository$Issues$Edges$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$Issues$Query$Repository$Issues$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository$Issues$PageInfo extends JsonSerializable
    with EquatableMixin {
  Issues$Query$Repository$Issues$PageInfo();

  factory Issues$Query$Repository$Issues$PageInfo.fromJson(
          Map<String, dynamic> json) =>
      _$Issues$Query$Repository$Issues$PageInfoFromJson(json);

  String? endCursor;

  late bool hasNextPage;

  @override
  List<Object?> get props => [endCursor, hasNextPage];
  @override
  Map<String, dynamic> toJson() =>
      _$Issues$Query$Repository$Issues$PageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository$Issues extends JsonSerializable
    with EquatableMixin {
  Issues$Query$Repository$Issues();

  factory Issues$Query$Repository$Issues.fromJson(Map<String, dynamic> json) =>
      _$Issues$Query$Repository$IssuesFromJson(json);

  List<Issues$Query$Repository$Issues$Edges?>? edges;

  late Issues$Query$Repository$Issues$PageInfo pageInfo;

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() => _$Issues$Query$Repository$IssuesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query$Repository extends JsonSerializable with EquatableMixin {
  Issues$Query$Repository();

  factory Issues$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$Issues$Query$RepositoryFromJson(json);

  late Issues$Query$Repository$Issues issues;

  @override
  List<Object?> get props => [issues];
  @override
  Map<String, dynamic> toJson() => _$Issues$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issues$Query extends JsonSerializable with EquatableMixin {
  Issues$Query();

  factory Issues$Query.fromJson(Map<String, dynamic> json) =>
      _$Issues$QueryFromJson(json);

  Issues$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$Issues$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issue$Query$Repository$Issue$Author extends JsonSerializable
    with EquatableMixin {
  Issue$Query$Repository$Issue$Author();

  factory Issue$Query$Repository$Issue$Author.fromJson(
          Map<String, dynamic> json) =>
      _$Issue$Query$Repository$Issue$AuthorFromJson(json);

  late String avatarUrl;

  late String login;

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$Issue$Query$Repository$Issue$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issue$Query$Repository$Issue extends JsonSerializable
    with EquatableMixin {
  Issue$Query$Repository$Issue();

  factory Issue$Query$Repository$Issue.fromJson(Map<String, dynamic> json) =>
      _$Issue$Query$Repository$IssueFromJson(json);

  Issue$Query$Repository$Issue$Author? author;

  late String bodyHTML;

  @override
  List<Object?> get props => [author, bodyHTML];
  @override
  Map<String, dynamic> toJson() => _$Issue$Query$Repository$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issue$Query$Repository extends JsonSerializable with EquatableMixin {
  Issue$Query$Repository();

  factory Issue$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$Issue$Query$RepositoryFromJson(json);

  Issue$Query$Repository$Issue? issue;

  @override
  List<Object?> get props => [issue];
  @override
  Map<String, dynamic> toJson() => _$Issue$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issue$Query extends JsonSerializable with EquatableMixin {
  Issue$Query();

  factory Issue$Query.fromJson(Map<String, dynamic> json) =>
      _$Issue$QueryFromJson(json);

  Issue$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$Issue$QueryToJson(this);
}

enum IssueState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum IssueOrderField {
  @JsonValue('COMMENTS')
  comments,
  @JsonValue('CREATED_AT')
  createdAt,
  @JsonValue('UPDATED_AT')
  updatedAt,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum OrderDirection {
  @JsonValue('ASC')
  asc,
  @JsonValue('DESC')
  desc,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class IssuesArguments extends JsonSerializable with EquatableMixin {
  IssuesArguments(
      {this.fetchMoreCursor,
      this.state,
      required this.field,
      required this.direction});

  @override
  factory IssuesArguments.fromJson(Map<String, dynamic> json) =>
      _$IssuesArgumentsFromJson(json);

  final String? fetchMoreCursor;

  @JsonKey(unknownEnumValue: IssueState.artemisUnknown)
  final List<IssueState>? state;

  @JsonKey(unknownEnumValue: IssueOrderField.artemisUnknown)
  late IssueOrderField field;

  @JsonKey(unknownEnumValue: OrderDirection.artemisUnknown)
  late OrderDirection direction;

  @override
  List<Object?> get props => [fetchMoreCursor, state, field, direction];
  @override
  Map<String, dynamic> toJson() => _$IssuesArgumentsToJson(this);
}

final ISSUES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Issues'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'fetchMoreCursor')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'state')),
            type: ListTypeNode(
                type: NamedTypeNode(
                    name: NameNode(value: 'IssueState'), isNonNull: true),
                isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'field')),
            type: NamedTypeNode(
                name: NameNode(value: 'IssueOrderField'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'direction')),
            type: NamedTypeNode(
                name: NameNode(value: 'OrderDirection'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: StringValueNode(value: 'flutter', isBlock: false)),
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: StringValueNode(value: 'flutter', isBlock: false))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'issues'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '20')),
                    ArgumentNode(
                        name: NameNode(value: 'states'),
                        value: VariableNode(name: NameNode(value: 'state'))),
                    ArgumentNode(
                        name: NameNode(value: 'after'),
                        value: VariableNode(
                            name: NameNode(value: 'fetchMoreCursor'))),
                    ArgumentNode(
                        name: NameNode(value: 'orderBy'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                              name: NameNode(value: 'field'),
                              value:
                                  VariableNode(name: NameNode(value: 'field'))),
                          ObjectFieldNode(
                              name: NameNode(value: 'direction'),
                              value: VariableNode(
                                  name: NameNode(value: 'direction')))
                        ]))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'node'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'databaseId'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'title'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'url'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'closed'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'number'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'createdAt'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'comments'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'totalCount'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null)
                                    ]))
                              ]))
                        ])),
                    FieldNode(
                        name: NameNode(value: 'pageInfo'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'endCursor'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'hasNextPage'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ]))
]);

class IssuesQuery extends GraphQLQuery<Issues$Query, IssuesArguments> {
  IssuesQuery({required this.variables});

  @override
  final DocumentNode document = ISSUES_QUERY_DOCUMENT;

  @override
  final String operationName = 'Issues';

  @override
  final IssuesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Issues$Query parse(Map<String, dynamic> json) => Issues$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssueArguments extends JsonSerializable with EquatableMixin {
  IssueArguments({required this.number});

  @override
  factory IssueArguments.fromJson(Map<String, dynamic> json) =>
      _$IssueArgumentsFromJson(json);

  late int number;

  @override
  List<Object?> get props => [number];
  @override
  Map<String, dynamic> toJson() => _$IssueArgumentsToJson(this);
}

final ISSUE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Issue'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'number')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: StringValueNode(value: 'flutter', isBlock: false)),
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: StringValueNode(value: 'flutter', isBlock: false))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'issue'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'number'),
                        value: VariableNode(name: NameNode(value: 'number')))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'author'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'avatarUrl'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'login'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: 'bodyHTML'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class IssueQuery extends GraphQLQuery<Issue$Query, IssueArguments> {
  IssueQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_QUERY_DOCUMENT;

  @override
  final String operationName = 'Issue';

  @override
  final IssueArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Issue$Query parse(Map<String, dynamic> json) => Issue$Query.fromJson(json);
}

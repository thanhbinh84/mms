// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node();

  factory GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$NodeFromJson(
          json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges
    extends JsonSerializable with EquatableMixin {
  GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges();

  factory GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$EdgesFromJson(
          json);

  GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues$Edges$Node$Labels
    extends JsonSerializable with EquatableMixin {
  GraphqlApi$Query$Repository$Issues$Edges$Node$Labels();

  factory GraphqlApi$Query$Repository$Issues$Edges$Node$Labels.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$LabelsFromJson(json);

  List<GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$Issues$Edges$Node$LabelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues$Edges$Node extends JsonSerializable
    with EquatableMixin {
  GraphqlApi$Query$Repository$Issues$Edges$Node();

  factory GraphqlApi$Query$Repository$Issues$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$Issues$Edges$NodeFromJson(json);

  late String title;

  late String url;

  GraphqlApi$Query$Repository$Issues$Edges$Node$Labels? labels;

  @override
  List<Object?> get props => [title, url, labels];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$Issues$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues$Edges extends JsonSerializable
    with EquatableMixin {
  GraphqlApi$Query$Repository$Issues$Edges();

  factory GraphqlApi$Query$Repository$Issues$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$Issues$EdgesFromJson(json);

  GraphqlApi$Query$Repository$Issues$Edges$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$Issues$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository$Issues extends JsonSerializable
    with EquatableMixin {
  GraphqlApi$Query$Repository$Issues();

  factory GraphqlApi$Query$Repository$Issues.fromJson(
          Map<String, dynamic> json) =>
      _$GraphqlApi$Query$Repository$IssuesFromJson(json);

  List<GraphqlApi$Query$Repository$Issues$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GraphqlApi$Query$Repository$IssuesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query$Repository extends JsonSerializable with EquatableMixin {
  GraphqlApi$Query$Repository();

  factory GraphqlApi$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$GraphqlApi$Query$RepositoryFromJson(json);

  late GraphqlApi$Query$Repository$Issues issues;

  @override
  List<Object?> get props => [issues];
  @override
  Map<String, dynamic> toJson() => _$GraphqlApi$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GraphqlApi$Query extends JsonSerializable with EquatableMixin {
  GraphqlApi$Query();

  factory GraphqlApi$Query.fromJson(Map<String, dynamic> json) =>
      _$GraphqlApi$QueryFromJson(json);

  GraphqlApi$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$GraphqlApi$QueryToJson(this);
}

final GRAPHQL_API_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: null,
      variableDefinitions: [],
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
                        name: NameNode(value: 'last'),
                        value: IntValueNode(value: '20'))
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
                                    name: NameNode(value: 'labels'),
                                    alias: null,
                                    arguments: [
                                      ArgumentNode(
                                          name: NameNode(value: 'first'),
                                          value: IntValueNode(value: '5'))
                                    ],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'edges'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'node'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: SelectionSetNode(
                                                    selections: [
                                                      FieldNode(
                                                          name: NameNode(
                                                              value: 'name'),
                                                          alias: null,
                                                          arguments: [],
                                                          directives: [],
                                                          selectionSet: null)
                                                    ]))
                                          ]))
                                    ]))
                              ]))
                        ]))
                  ]))
            ]))
      ]))
]);

class GraphqlApiQuery extends GraphQLQuery<GraphqlApi$Query, JsonSerializable> {
  GraphqlApiQuery();

  @override
  final DocumentNode document = GRAPHQL_API_QUERY_DOCUMENT;

  @override
  final String operationName = 'graphql_api';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GraphqlApi$Query parse(Map<String, dynamic> json) =>
      GraphqlApi$Query.fromJson(json);
}

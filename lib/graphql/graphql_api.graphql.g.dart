// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node
    _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node()
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$NodeToJson(
            GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node
                instance) =>
        <String, dynamic>{
          'name': instance.name,
        };

GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges
    _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$EdgesFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges()
    ..node = json['node'] == null
        ? null
        : GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String,
    dynamic> _$GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$EdgesToJson(
        GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GraphqlApi$Query$Repository$Issues$Edges$Node$Labels
    _$GraphqlApi$Query$Repository$Issues$Edges$Node$LabelsFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$Edges$Node$Labels()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GraphqlApi$Query$Repository$Issues$Edges$Node$Labels$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GraphqlApi$Query$Repository$Issues$Edges$Node$LabelsToJson(
            GraphqlApi$Query$Repository$Issues$Edges$Node$Labels instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GraphqlApi$Query$Repository$Issues$Edges$Node
    _$GraphqlApi$Query$Repository$Issues$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$Edges$Node()
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..labels = json['labels'] == null
        ? null
        : GraphqlApi$Query$Repository$Issues$Edges$Node$Labels.fromJson(
            json['labels'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GraphqlApi$Query$Repository$Issues$Edges$NodeToJson(
        GraphqlApi$Query$Repository$Issues$Edges$Node instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'labels': instance.labels?.toJson(),
    };

GraphqlApi$Query$Repository$Issues$Edges
    _$GraphqlApi$Query$Repository$Issues$EdgesFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$Edges()
    ..node = json['node'] == null
        ? null
        : GraphqlApi$Query$Repository$Issues$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GraphqlApi$Query$Repository$Issues$EdgesToJson(
        GraphqlApi$Query$Repository$Issues$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GraphqlApi$Query$Repository$Issues _$GraphqlApi$Query$Repository$IssuesFromJson(
    Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GraphqlApi$Query$Repository$Issues$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GraphqlApi$Query$Repository$IssuesToJson(
        GraphqlApi$Query$Repository$Issues instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GraphqlApi$Query$Repository _$GraphqlApi$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository()
    ..issues = GraphqlApi$Query$Repository$Issues.fromJson(
        json['issues'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GraphqlApi$Query$RepositoryToJson(
        GraphqlApi$Query$Repository instance) =>
    <String, dynamic>{
      'issues': instance.issues.toJson(),
    };

GraphqlApi$Query _$GraphqlApi$QueryFromJson(Map<String, dynamic> json) {
  return GraphqlApi$Query()
    ..repository = json['repository'] == null
        ? null
        : GraphqlApi$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GraphqlApi$QueryToJson(GraphqlApi$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

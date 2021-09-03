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
    ..databaseId = json['databaseId'] as int?
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
      'databaseId': instance.databaseId,
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

GraphqlApi$Query$Repository$Issues$PageInfo
    _$GraphqlApi$Query$Repository$Issues$PageInfoFromJson(
        Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues$PageInfo()
    ..endCursor = json['endCursor'] as String?
    ..hasNextPage = json['hasNextPage'] as bool;
}

Map<String, dynamic> _$GraphqlApi$Query$Repository$Issues$PageInfoToJson(
        GraphqlApi$Query$Repository$Issues$PageInfo instance) =>
    <String, dynamic>{
      'endCursor': instance.endCursor,
      'hasNextPage': instance.hasNextPage,
    };

GraphqlApi$Query$Repository$Issues _$GraphqlApi$Query$Repository$IssuesFromJson(
    Map<String, dynamic> json) {
  return GraphqlApi$Query$Repository$Issues()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GraphqlApi$Query$Repository$Issues$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList()
    ..pageInfo = GraphqlApi$Query$Repository$Issues$PageInfo.fromJson(
        json['pageInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GraphqlApi$Query$Repository$IssuesToJson(
        GraphqlApi$Query$Repository$Issues instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
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

GraphqlApiArguments _$GraphqlApiArgumentsFromJson(Map<String, dynamic> json) {
  return GraphqlApiArguments(
    fetchMoreCursor: json['fetchMoreCursor'] as String?,
    state: (json['state'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$IssueStateEnumMap, e,
            unknownValue: IssueState.artemisUnknown))
        .toList(),
    field: _$enumDecode(_$IssueOrderFieldEnumMap, json['field'],
        unknownValue: IssueOrderField.artemisUnknown),
    direction: _$enumDecode(_$OrderDirectionEnumMap, json['direction'],
        unknownValue: OrderDirection.artemisUnknown),
  );
}

Map<String, dynamic> _$GraphqlApiArgumentsToJson(
        GraphqlApiArguments instance) =>
    <String, dynamic>{
      'fetchMoreCursor': instance.fetchMoreCursor,
      'state': instance.state?.map((e) => _$IssueStateEnumMap[e]).toList(),
      'field': _$IssueOrderFieldEnumMap[instance.field],
      'direction': _$OrderDirectionEnumMap[instance.direction],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$IssueStateEnumMap = {
  IssueState.closed: 'CLOSED',
  IssueState.open: 'OPEN',
  IssueState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$IssueOrderFieldEnumMap = {
  IssueOrderField.comments: 'COMMENTS',
  IssueOrderField.createdAt: 'CREATED_AT',
  IssueOrderField.updatedAt: 'UPDATED_AT',
  IssueOrderField.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$OrderDirectionEnumMap = {
  OrderDirection.asc: 'ASC',
  OrderDirection.desc: 'DESC',
  OrderDirection.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

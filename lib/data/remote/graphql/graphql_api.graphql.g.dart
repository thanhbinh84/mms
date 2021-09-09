// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issues$Query$Repository$Issues$Edges$Node$Comments
    _$Issues$Query$Repository$Issues$Edges$Node$CommentsFromJson(
        Map<String, dynamic> json) {
  return Issues$Query$Repository$Issues$Edges$Node$Comments()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$Issues$Query$Repository$Issues$Edges$Node$CommentsToJson(
        Issues$Query$Repository$Issues$Edges$Node$Comments instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

Issues$Query$Repository$Issues$Edges$Node
    _$Issues$Query$Repository$Issues$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return Issues$Query$Repository$Issues$Edges$Node()
    ..databaseId = json['databaseId'] as int?
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..closed = json['closed'] as bool
    ..number = json['number'] as int
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..comments = Issues$Query$Repository$Issues$Edges$Node$Comments.fromJson(
        json['comments'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issues$Query$Repository$Issues$Edges$NodeToJson(
        Issues$Query$Repository$Issues$Edges$Node instance) =>
    <String, dynamic>{
      'databaseId': instance.databaseId,
      'title': instance.title,
      'url': instance.url,
      'closed': instance.closed,
      'number': instance.number,
      'createdAt': instance.createdAt.toIso8601String(),
      'comments': instance.comments.toJson(),
    };

Issues$Query$Repository$Issues$Edges
    _$Issues$Query$Repository$Issues$EdgesFromJson(Map<String, dynamic> json) {
  return Issues$Query$Repository$Issues$Edges()
    ..node = json['node'] == null
        ? null
        : Issues$Query$Repository$Issues$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issues$Query$Repository$Issues$EdgesToJson(
        Issues$Query$Repository$Issues$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

Issues$Query$Repository$Issues$PageInfo
    _$Issues$Query$Repository$Issues$PageInfoFromJson(
        Map<String, dynamic> json) {
  return Issues$Query$Repository$Issues$PageInfo()
    ..endCursor = json['endCursor'] as String?
    ..hasNextPage = json['hasNextPage'] as bool;
}

Map<String, dynamic> _$Issues$Query$Repository$Issues$PageInfoToJson(
        Issues$Query$Repository$Issues$PageInfo instance) =>
    <String, dynamic>{
      'endCursor': instance.endCursor,
      'hasNextPage': instance.hasNextPage,
    };

Issues$Query$Repository$Issues _$Issues$Query$Repository$IssuesFromJson(
    Map<String, dynamic> json) {
  return Issues$Query$Repository$Issues()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : Issues$Query$Repository$Issues$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList()
    ..pageInfo = Issues$Query$Repository$Issues$PageInfo.fromJson(
        json['pageInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issues$Query$Repository$IssuesToJson(
        Issues$Query$Repository$Issues instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

Issues$Query$Repository _$Issues$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return Issues$Query$Repository()
    ..issues = Issues$Query$Repository$Issues.fromJson(
        json['issues'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issues$Query$RepositoryToJson(
        Issues$Query$Repository instance) =>
    <String, dynamic>{
      'issues': instance.issues.toJson(),
    };

Issues$Query _$Issues$QueryFromJson(Map<String, dynamic> json) {
  return Issues$Query()
    ..repository = json['repository'] == null
        ? null
        : Issues$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issues$QueryToJson(Issues$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

Issue$Query$Repository$Issue$Author
    _$Issue$Query$Repository$Issue$AuthorFromJson(Map<String, dynamic> json) {
  return Issue$Query$Repository$Issue$Author()
    ..avatarUrl = json['avatarUrl'] as String
    ..login = json['login'] as String;
}

Map<String, dynamic> _$Issue$Query$Repository$Issue$AuthorToJson(
        Issue$Query$Repository$Issue$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'login': instance.login,
    };

Issue$Query$Repository$Issue _$Issue$Query$Repository$IssueFromJson(
    Map<String, dynamic> json) {
  return Issue$Query$Repository$Issue()
    ..author = json['author'] == null
        ? null
        : Issue$Query$Repository$Issue$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..bodyHTML = json['bodyHTML'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$Issue$Query$Repository$IssueToJson(
        Issue$Query$Repository$Issue instance) =>
    <String, dynamic>{
      'author': instance.author?.toJson(),
      'bodyHTML': instance.bodyHTML,
      'body': instance.body,
    };

Issue$Query$Repository _$Issue$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return Issue$Query$Repository()
    ..issue = json['issue'] == null
        ? null
        : Issue$Query$Repository$Issue.fromJson(
            json['issue'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issue$Query$RepositoryToJson(
        Issue$Query$Repository instance) =>
    <String, dynamic>{
      'issue': instance.issue?.toJson(),
    };

Issue$Query _$Issue$QueryFromJson(Map<String, dynamic> json) {
  return Issue$Query()
    ..repository = json['repository'] == null
        ? null
        : Issue$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Issue$QueryToJson(Issue$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

IssuesArguments _$IssuesArgumentsFromJson(Map<String, dynamic> json) {
  return IssuesArguments(
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

Map<String, dynamic> _$IssuesArgumentsToJson(IssuesArguments instance) =>
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

IssueArguments _$IssueArgumentsFromJson(Map<String, dynamic> json) {
  return IssueArguments(
    number: json['number'] as int,
  );
}

Map<String, dynamic> _$IssueArgumentsToJson(IssueArguments instance) =>
    <String, dynamic>{
      'number': instance.number,
    };

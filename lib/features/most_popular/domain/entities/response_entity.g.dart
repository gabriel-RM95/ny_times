// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseEntity _$ResponseEntityFromJson(Map<String, dynamic> json) =>
    ResponseEntity(
      status: json['status'] as String,
      numResults: json['num_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseEntityToJson(ResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'num_results': instance.numResults,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

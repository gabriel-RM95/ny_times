// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleEntity _$ArticleEntityFromJson(Map<String, dynamic> json) =>
    ArticleEntity(
      url: json['url'] as String,
      section: json['section'] as String?,
      byline: json['byline'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      publishedDate: json['published_date'] as String,
      source: json['source'] as String,
      updated: json['updated'] as String,
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleEntityToJson(ArticleEntity instance) =>
    <String, dynamic>{
      'url': instance.url,
      'section': instance.section,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'abstract': instance.abstract,
      'published_date': instance.publishedDate,
      'source': instance.source,
      'updated': instance.updated,
      'media': instance.media.map((e) => e.toJson()).toList(),
    };

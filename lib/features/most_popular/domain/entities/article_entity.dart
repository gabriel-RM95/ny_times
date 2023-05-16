import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ny_times/features/most_popular/domain/entities/media.dart';

part 'article_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleEntity extends Equatable {
  final String url;
  final String? section;
  final String byline;
  final String type;
  final String title;
  final String abstract;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  final String source;
  final String updated;
  final List<Media> media;

  const ArticleEntity({
    required this.url,
    this.section,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstract,
    required this.publishedDate,
    required this.source,
    required this.updated,
    required this.media,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);

  @override
  List<Object?> get props => [
        url,
        section,
        byline,
        type,
        title,
        abstract,
        publishedDate,
        source,
        updated,
        media
      ];
}

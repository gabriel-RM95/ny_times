import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ny_times/features/most_popular/domain/entities/article_entity.dart';

part 'response_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseEntity extends Equatable {
  final String status;
  @JsonKey(name: 'num_results')
  final int numResults;
  final List<ArticleEntity> results;

  const ResponseEntity({
    required this.status,
    required this.numResults,
    required this.results,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseEntityToJson(this);

  @override
  List<Object?> get props => [status, numResults, results];
}

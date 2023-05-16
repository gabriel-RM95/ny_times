import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_metadata.g.dart';

@JsonSerializable()
class MediaMetadata extends Equatable {
  final String url;
  final String format;

  const MediaMetadata(this.url, this.format);

  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);

  @override
  List<Object?> get props => [url, format];
}

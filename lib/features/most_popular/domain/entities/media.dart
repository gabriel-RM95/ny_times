import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'media_metadata.dart';

part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media extends Equatable {
  final String type;
  final String caption;
  @JsonKey(name: 'media-metadata')
  final List<MediaMetadata> images;

  const Media(
      {required this.type, required this.caption, required this.images});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

  String getImageByFormat(String format) {
    int i = 0;
    while (images[i].format != format) {
      i++;
    }
    return images[i].url;
  }

  @override
  List<Object?> get props => [type, caption, images];
}

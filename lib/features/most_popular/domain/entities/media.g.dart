// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      type: json['type'] as String,
      caption: json['caption'] as String,
      images: (json['media-metadata'] as List<dynamic>)
          .map((e) => MediaMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'type': instance.type,
      'caption': instance.caption,
      'media-metadata': instance.images.map((e) => e.toJson()).toList(),
    };

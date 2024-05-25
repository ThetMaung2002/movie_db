// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreVo _$GenreVoFromJson(Map<String, dynamic> json) => GenreVo(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
    );

Map<String, dynamic> _$GenreVoToJson(GenreVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

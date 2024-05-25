// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      json['dates'] == null
          ? null
          : DatesVo.fromJson(json['dates'] as Map<String, dynamic>),
      (json['page'] as num?)?.toInt(),
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total_pages'] as num?)?.toInt(),
      (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

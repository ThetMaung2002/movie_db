// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorResponse _$ActorResponseFromJson(Map<String, dynamic> json) =>
    ActorResponse(
      (json['page'] as num?)?.toInt(),
      (json['results'] as List<dynamic>?)
          ?.map((e) => ActorVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total_pages'] as num?)?.toInt(),
      (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActorResponseToJson(ActorResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

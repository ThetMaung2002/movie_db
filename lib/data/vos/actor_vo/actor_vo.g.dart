// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorVo _$ActorVoFromJson(Map<String, dynamic> json) => ActorVo(
      json['adult'] as bool?,
      (json['gender'] as num?)?.toInt(),
      (json['id'] as num?)?.toInt(),
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      json['popularity'] as num?,
      json['profile_path'] as String?,
    )..knownFor = (json['known_for'] as List<dynamic>?)
        ?.map((e) => KnownForVo.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ActorVoToJson(ActorVo instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownForVo _$KnownForVoFromJson(Map<String, dynamic> json) => KnownForVo(
      json['backdrop_path'] as String?,
      (json['id'] as num?)?.toInt(),
      json['original_title'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['media_type'] as String?,
      json['adult'] as bool?,
      json['title'] as String?,
      json['original_language'] as String?,
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      json['popularity'] as num?,
      json['release_date'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num?,
      (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KnownForVoToJson(KnownForVo instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

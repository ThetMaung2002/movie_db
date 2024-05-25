// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVo _$MovieVoFromJson(Map<String, dynamic> json) => MovieVo(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['id'] as num?)?.toInt(),
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      json['popularity'] as num?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num?,
      (json['vote_count'] as num?)?.toInt(),
      isGetNowPlaying: json['isGetNowPlaying'] as bool?,
      isPopularMovie: json['isPopularMovie'] as bool?,
      isTopRated: json['isTopRated'] as bool?,
    );

Map<String, dynamic> _$MovieVoToJson(MovieVo instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'isGetNowPlaying': instance.isGetNowPlaying,
      'isPopularMovie': instance.isPopularMovie,
      'isTopRated': instance.isTopRated,
    };
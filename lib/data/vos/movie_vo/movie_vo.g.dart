// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVoAdapter extends TypeAdapter<MovieVo> {
  @override
  final int typeId = 1;

  @override
  MovieVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVo(
      fields[0] as bool?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as num?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool?,
      fields[12] as num?,
      fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVo obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
    };

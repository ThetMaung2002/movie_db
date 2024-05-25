import 'package:json_annotation/json_annotation.dart';

part 'known_for_vo.g.dart';

@JsonSerializable()
class KnownForVo {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'media_type')
  String? mediaType;

  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'popularity')
  num? popularity;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'vote_average')
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  KnownForVo(
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.title,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  factory KnownForVo.fromJson(Map<String, dynamic> json) =>
      _$KnownForVoFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForVoToJson(this);
}

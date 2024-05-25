import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/genre_vo/genre_vo.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse{
  @JsonKey(name: 'genre')
  List<GenreVo>? genre;

  GenreResponse(this.genre);

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
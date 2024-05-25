import 'package:json_annotation/json_annotation.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
class GenreVo {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  GenreVo(this.id, this.name);

  factory GenreVo.fromJson(Map<String, dynamic> json) => _$GenreVoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVoToJson(this);
}
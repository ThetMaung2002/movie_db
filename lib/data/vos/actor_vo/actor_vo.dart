import 'package:json_annotation/json_annotation.dart';

import 'known_for_vo/known_for_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
class ActorVo {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: 'gender')
  int? gender;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'popularity')
  num? popularity;

  @JsonKey(name: 'profile_path')
  String? profilePath;

  @JsonKey(name: 'known_for')
  List<KnownForVo>? knownFor;

  ActorVo(
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  );

  factory ActorVo.fromJson(Map<String, dynamic> json) =>
      _$ActorVoFromJson(json);

  Map<String, dynamic> toJson() => _$ActorVoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';

part 'actor_response.g.dart';

@JsonSerializable()
class ActorResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<ActorVo>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  ActorResponse(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );

  factory ActorResponse.fromJson(Map<String, dynamic> json) =>
      _$ActorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActorResponseToJson(this);
}

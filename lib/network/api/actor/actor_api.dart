import 'package:dio/dio.dart';
import 'package:movie_db/constants/api_constants.dart';
import 'package:movie_db/network/response/actor_response/actor_response.dart';
import 'package:retrofit/http.dart';

part 'actor_api.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class ActorApi {
  factory ActorApi(Dio dio) => _ActorApi(dio);

  @GET("/person/popular")
  Future<ActorResponse> getActor(
    @Query(kApiKey) String apiKey,
    @Query(kPage) int page,
  );
}

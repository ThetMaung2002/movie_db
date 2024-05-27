import 'package:dio/dio.dart';
import 'package:movie_db/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/movie_response/movie_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieApi {
  factory MovieApi(Dio dio) => _MovieApi(dio);

  @GET(kGetNowPlayingEndPoint)
  Future<MovieResponse> getNowPlayingMoviesResponse(
    @Query(kApiKey) String apiKey,
    @Query(kPage) int page,
  );

  @GET(kGetPopularMovieList)
  Future<MovieResponse> getPopularMovieListResponse(
    @Query(kApiKey) String apiKey,
    @Query(kPage) int page,
  );
}

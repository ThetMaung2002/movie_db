import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../constants/api_constants.dart';
import '../../genre_response/genre_response.dart';

part 'genre_api.g.dart';

@RestApi(baseUrl: kBaseURL2)
abstract class GenreApi {
  factory GenreApi(Dio dio) => _GenreApi(dio);

  @GET(kMovieList)
  Future<GenreResponse> getGenreListResponse(
    @Query(kApiKey) String apiKey,
  );
}

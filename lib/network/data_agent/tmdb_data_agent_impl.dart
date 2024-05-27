import 'package:dio/dio.dart';
import 'package:movie_db/constants/api_constants.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/tmdb_data_agent.dart';

import '../api/movie/movie_api.dart';

class TMDBDataAgentImpl extends TMDBDataAgent {
  late MovieApi _api;

  TMDBDataAgentImpl._() {
    _api = MovieApi(Dio());
  }

  static final TMDBDataAgentImpl _singleton = TMDBDataAgentImpl._();

  factory TMDBDataAgentImpl() => _singleton;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Future<List<MovieVo>?> getNowPlayingMovies(int page) => _api
      .getNowPlayingMoviesResponse(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;
}

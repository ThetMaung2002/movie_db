import 'package:movie_db/data/apply/tmdb_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/tmdb_data_agent_impl.dart';

import '../../network/data_agent/tmdb_data_agent.dart';

class TMDBApplyImpl extends TMDBApply{

  final TMDBDataAgent dataAgent = TMDBDataAgentImpl();

  TMDBApplyImpl._();

  static final TMDBApplyImpl _singleton = TMDBApplyImpl._();

  factory TMDBApplyImpl() => _singleton;
  @override
  Future<List<MovieVo>?> getNowPlayingMovie(int page) => dataAgent.getNowPlayingMovies(page).then((value)  {
    var temp = value;
    temp = temp?.map((e) {
        e.isGetNowPlaying= true;
        return e;
    }).toList();
    return value;
  });
  
}
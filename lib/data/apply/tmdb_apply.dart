import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';

abstract class TMDBApply{
  Future<List<MovieVo>?> getNowPlayingMovie(int page);
}
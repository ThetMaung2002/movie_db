import '../../data/vos/movie_vo/movie_vo.dart';

abstract class MovieDao {
  void save(List<MovieVo> movies);
}

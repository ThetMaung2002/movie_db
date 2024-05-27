import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_db/constants/hive_constant.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/persistent/movie_data_access_object/movie_dao.dart';

class MovieDaoImpl extends MovieDao {
  MovieDaoImpl._();

  static final MovieDaoImpl _singleton = MovieDaoImpl._();

  factory MovieDaoImpl() => _singleton;

  Box<MovieVo> _getMovieBox() => Hive.box(kHiveBoxMovie);

  @override
  void save(List<MovieVo> movies) {
    /// For Loop using Dart recommended looping function.
    Map<int, MovieVo> movieMap = {
      for (var movies in movies) movies.id ?? -1: movies,
    };
    _getMovieBox().putAll(movieMap);
  }
}

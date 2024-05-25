import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';

abstract class TMDBDataAgent{
  Future<List<MovieVo>?> getNowPlayingMovies(int page);
  Future<List<GenreVo>?> getGenreList();
}
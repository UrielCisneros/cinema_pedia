import 'package:cinema_pedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayng({int page = 1});
}

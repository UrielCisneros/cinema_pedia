import 'package:cinema_pedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayng({int page = 1});
}

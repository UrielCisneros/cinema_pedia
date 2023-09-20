import 'package:cinema_pedia/config/constans/environment.dart';
import 'package:cinema_pedia/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        'api_key': Environment.theMovieKey,
        'language': "es-MX"
      }));

  @override
  Future<List<Movie>> getNowPlayng({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movie = [];
    return movie;
  }
}

import 'package:dio/dio.dart';

import 'package:cinema_pedia/config/constans/environment.dart';
import 'package:cinema_pedia/domain/datasources/movies_datasource.dart';

import 'package:cinema_pedia/domain/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_pedia/domain/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';

class MovieDbDatasource extends MoviesDatasource {
  //Se agrega la configuracion del paquete dio para hacer la peticion
  final dio = Dio(
      BaseOptions(baseUrl: "https://api.themoviedb.org/3", queryParameters: {
    //Se agrega vatiable de entorno en forma de constante para no comprometer la app
    'api_key': Environment.theMovieKey,
    'language': "es-MX"
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    //Se hace la peticion
    final response = await dio.get('/movie/now_playing');
    //Se convierte la peticion a una entidad creada con el quicktype (La entidad que nos responde la api)
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    //Y aqui comvertimos la entidad de la api a una nuestra con nuestro propio modelo, que esta en la clase MovieMapper
    final List<Movie> movie = movieDbResponse.results
        //Este where() sirve para poder hacer un filtro en un mapper
        .where((movieDbApi) => movieDbApi.posterPath != 'no-poster')
        .map((movieDbApi) => MovieMapper.movieDBToEntity(movieDbApi))
        .toList();
    return movie;
  }
}

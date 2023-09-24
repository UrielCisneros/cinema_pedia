import 'package:cinema_pedia/config/constans/environment.dart';
import 'package:cinema_pedia/domain/datasources/actors_datasource.dart';
import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/domain/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema_pedia/domain/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieKey,
        'language': "es-MX"
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String idMovie) async {
    final response = await dio.get('/movie/$idMovie/credits');
    final actorsResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = actorsResponse.cast
        .map((cast) => ActorMapper.castToEntoty(cast))
        .toList();
    return actors;
  }
}

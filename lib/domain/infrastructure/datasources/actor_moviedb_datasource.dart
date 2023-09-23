import 'package:cinema_pedia/domain/datasources/actors_datasource.dart';
import 'package:cinema_pedia/domain/entities/actor.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovie(String idMovie) async {
    return [];
  }
}

import 'package:cinema_pedia/domain/datasources/actors_datasource.dart';
import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/domain/repositories/actors_repository.dart';

class ActorRepoitoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorRepoitoryImpl(this.actorsDatasource);

  @override
  Future<List<Actor>> getActorsByMovie(String idMovie) {
    return actorsDatasource.getActorsByMovie(idMovie);
  }
}

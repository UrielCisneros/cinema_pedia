//Este provider es inmutable
import 'package:cinema_pedia/domain/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinema_pedia/domain/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepoitoryImpl(ActorMovieDbDatasource());
});

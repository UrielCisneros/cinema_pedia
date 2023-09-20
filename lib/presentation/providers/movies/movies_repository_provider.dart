import 'package:cinema_pedia/domain/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema_pedia/domain/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este provider es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRespositoryImpl(MovieDbDatasource());
});

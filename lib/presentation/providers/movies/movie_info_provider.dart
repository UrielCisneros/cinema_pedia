import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovies = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovieCallBack: getMovies);
});

typedef GetMovieCallBack = Future<Movie> Function({String id});

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovieCallBack}) : super({});

  final GetMovieCallBack getMovieCallBack;

  Future<void> loadMovie({String id = ''}) async {
    if (state[id] != null) return;
    print("realizando peticion");
    final Movie movie = await getMovieCallBack(id: id);
    state = {...state, id: movie};
  }
}

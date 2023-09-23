import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final nowPopularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upComingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMovieProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getToRated;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Se define el tipo de callback que se espera
// typedef MovieCallBack = Future<List<Movie>> Function({int page});

typedef MovieCallback = Future<List<Movie>> Function({int page});

//Se define provider que controlara toda la informacion en el estado (Este es como el reducer)
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;
  // final fetchMoreMovies;
  //Cuando se crea la instancia se le asigna el valor colocado en super
  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

//Funcion para cambiar de pagina
  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    print("load movie");
    //Se aumenta la pagina
    currentPage++;
    //Se hace la peticion con la nueva pagina
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    //Se agregan las paginas actuales y las nuevas
    state = [...state, ...movies];
    isDelayRenderMovies();
    isLoading = false;
  }

  Future<void> isDelayRenderMovies() async =>
      await Future.delayed(const Duration(milliseconds: 300));
}

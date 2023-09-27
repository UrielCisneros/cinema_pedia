import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:cinema_pedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const pathName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //Aqui el read del provider ejecuta la funcion de loadNextPage que por defecto es 0
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(nowPopularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMovieProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final slideCardMovies = ref.watch(movieSlidesCardsProvider);
    final nowPlaingMovie = ref.watch(nowPlayingMoviesProvider);
    final nowPopularMovies = ref.watch(nowPopularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMovieProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),
            MoviesSlideCard(
              movies: slideCardMovies,
            ),
            MovieHorizontalListview(
              movies: nowPlaingMovie,
              title: 'Cines',
              subTitle: 'Lunes',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
            const SizedBox(height: 5),
            MovieHorizontalListview(
              movies: upComingMovies,
              title: 'Proximamente',
              subTitle: 'Miercoles',
              loadNextPage: () =>
                  ref.read(upComingMoviesProvider.notifier).loadNextPage(),
            ),
            const SizedBox(height: 5),
            MovieHorizontalListview(
              movies: nowPopularMovies,
              title: 'Populares',
              // subTitle: 'Martes',
              loadNextPage: () =>
                  ref.read(nowPopularMoviesProvider.notifier).loadNextPage(),
            ),
            const SizedBox(height: 5),
            MovieHorizontalListview(
              movies: topRatedMovies,
              title: 'Top',
              subTitle: 'Lunes',
              loadNextPage: () =>
                  ref.read(topRatedMovieProvider.notifier).loadNextPage(),
            ),
            const SizedBox(height: 50),
          ],
        );
      }, childCount: 1))
    ]);
  }
}

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
  }

  @override
  Widget build(BuildContext context) {
    final slideCardMovies = ref.watch(movieSlidesCardsProvider);
    final nowPlaingMovie = ref.watch(nowPlayingMoviesProvider);
    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideCard(
          movies: slideCardMovies,
        ),
        MovieHorizontalListview(
          movies: nowPlaingMovie,
          title: 'Cines',
          subTitle: 'Lunes',
        )
      ],
    );
  }
}

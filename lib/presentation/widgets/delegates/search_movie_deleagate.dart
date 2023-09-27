import 'package:animate_do/animate_do.dart';
import 'package:cinema_pedia/config/helpers/movies_format.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function({String search});

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallBack searchMoviesCallBack;

  SearchMovieDelegate({required this.searchMoviesCallBack});

  @override
  String get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Este es el boton de la derecha para borrar el texto o hacer la busqueda
    return [
      FadeInRight(
          animate: query.isNotEmpty,
          child: IconButton(
              onPressed: () => query = '', icon: const Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Esta es el boton de la izquiersa para regresar
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    //Esta es la peticion final
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Esta hace la peticion es cada que se hace el tipeo
    return FutureBuilder(
      future: searchMoviesCallBack(search: query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              _MovieSearchItem(movie: movies[index]),
        );
      },
    );
  }
}

class _MovieSearchItem extends StatelessWidget {
  const _MovieSearchItem({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          //Image
          SizedBox(
            width: size.width * 0.15,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          //Descripcion
          SizedBox(
            width: size.width * 0.65,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                movie.originalTitle,
                style: textTheme.titleMedium,
              ),
              (movie.overview.length > 50)
                  ? Text("${movie.overview.substring(0, 50)}...")
                  : Text(movie.overview),
              Row(
                children: [
                  Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    MovieFormat.viewMovieFormat(movie.popularity, 1),
                    style: textTheme.bodyMedium!
                        .copyWith(color: Colors.yellow.shade900),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

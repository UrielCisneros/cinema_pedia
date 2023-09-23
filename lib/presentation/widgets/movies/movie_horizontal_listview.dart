import 'package:cinema_pedia/config/helpers/movies_format.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null && subTitle != null)
            _Header(
              title: title,
              subTitle: subTitle,
            ),
          _ListView(
            movies: movies,
          ),
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;

    return Expanded(
        child: ListView.builder(
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Esto es el poster de las peliculas
              SizedBox(
                width: 150,
                // height: 230,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(movie.posterPath),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        }
                        return child;
                      },
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              //Titulo de la pelicula
              SizedBox(
                width: 150,
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: themeText.titleSmall,
                ),
              ),

              //Rating

              SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.yellow.shade800,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2.5, left: 3),
                      child: Text(
                        '${movie.voteAverage}',
                        style: themeText.bodyMedium!
                            .copyWith(color: Colors.yellow.shade800),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        MovieFormat.viewMovieFormat(movie.popularity),
                        style: themeText.bodySmall,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    this.title,
    this.subTitle,
  });

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              '$title',
              style: themeText,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: null,
                child: Text(
                  '$subTitle',
                )),
        ],
      ),
    );
  }
}

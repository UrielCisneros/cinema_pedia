import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
// import 'package:animate_do/animate_do.dart';

class MoviesSlideCard extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        viewportFraction: 0.8,
        scale: 0.9,
        // loop: true,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 13))
        ]);

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(movie.backdropPath),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  return child;
                },
              ),
            )));
  }
}

import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:cinema_pedia/presentation/widgets/delegates/search_movie_deleagate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = Theme.of(context).colorScheme;

    final movieSearch = ref.read(movieRepositoryProvider).searchMovies;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: themeColor.primary),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Cinepedia",
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: SearchMovieDelegate(
                              searchMoviesCallBack: movieSearch));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}

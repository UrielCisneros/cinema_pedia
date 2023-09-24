import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorMapNotifier, Map<String, List<Actor>>>((ref) {
  final getActors = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorMapNotifier(getActors);
});

typedef GetActosCallBack = Future<List<Actor>> Function(String idMovie);

class ActorMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorMapNotifier(this.getActosByMovie) : super({});

  final GetActosCallBack getActosByMovie;

  Future<void> loadActors(String idMovie) async {
    if (state[idMovie] != null) return;
    // print("realizando peticion Actors");
    final List<Actor> actors = await getActosByMovie(idMovie);
    state = {...state, idMovie: actors};
  }
}

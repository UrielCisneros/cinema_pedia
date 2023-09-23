import 'package:cinema_pedia/domain/entities/actor.dart';
import 'package:cinema_pedia/domain/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntoty(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
      character: cast.character);
}

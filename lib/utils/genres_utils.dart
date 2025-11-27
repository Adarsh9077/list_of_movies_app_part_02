import 'package:get_it/get_it.dart';
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/services/init_getit.dart';

class GenresUtils {
  static List<MoviesGenres> moviesGenresName(List<int> genresIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesRepository.cachedGenres;
    List<MoviesGenres> genresNames = [];
    for (var genresId in genresIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genresId,
        orElse: () => MoviesGenres(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}

import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/services/api_services.dart';
import '../models/movies_genres.dart';

class MoviesRepository {
  final ApiServices _apiServices;

  MoviesRepository(this._apiServices);

  Future<List<MoviesModal>> fetchMovies({int page = 1}) async {
    return await _apiServices.fetchMovies(page: page);
  }

  // List<MoviesGenres> cachedGenres = [];

  Future<List<MoviesGenres>> fetchGenres() async {
    return await _apiServices.fetchGenres();
  }
}

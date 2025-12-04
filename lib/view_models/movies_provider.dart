import 'package:flutter/material.dart';
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/services/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  int _currentPage = 1;
  final List<MoviesModal> _moviesList = [];
  List<MoviesModal> get moviesList => _moviesList;

  List<MoviesGenres> _genresList = [];
  List<MoviesGenres> get genresList => _genresList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _fetchMoviesError = '';
  String get fetchMoviesError => _fetchMoviesError;

  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();
  Future<void> getMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_genresList.isEmpty) {
        _genresList = await _moviesRepository.fetchGenres();
      }
      List<MoviesModal> movies = await _moviesRepository.fetchMovies(
        page: _currentPage,
      );
      _moviesList.addAll(movies);
    } catch (error) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

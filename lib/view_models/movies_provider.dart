import 'package:flutter/material.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/services/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  int _currentPage = 1;
  final List<MoviesModal> _moviesList = [];
  List<MoviesModal> get moviesList => _moviesList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _fetchMoviesError = '';
  String get fetchMoviesError => _fetchMoviesError;

  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();
  Future<void> getMovies() async {}
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  final List<MoviesModal> _favoritesList = [];
  List<MoviesModal> get favoritesList => _favoritesList;
  final String favsKey = "favsKey";

  bool isFavorite(MoviesModal moviesModal) {
    return _favoritesList.any((movie) => movie.id == moviesModal.id);
  }

  Future<void> addOrRemoveFromFavorites(MoviesModal moviesModal) async {
    if (isFavorite(moviesModal)) {
      _favoritesList.removeWhere((movie) => movie.id == moviesModal.id);
    } else {
      _favoritesList.add(moviesModal);
    }
    await saveFavorites();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final pref = await SharedPreferences.getInstance();
    final stringList = _favoritesList
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    pref.setStringList(favsKey, stringList);
  }

  Future<void> loadFavorites() async {
    final pref = await SharedPreferences.getInstance();
    final stringList = pref.getStringList(favsKey) ?? [];
    _favoritesList.clear();
    _favoritesList.addAll(
      stringList.map((movie) => MoviesModal.fromJson(json.decode(movie))),
    );
    notifyListeners();
  }

  void clearAllFavorite() {
    _favoritesList.clear();
    notifyListeners();
    saveFavorites();
  }
}

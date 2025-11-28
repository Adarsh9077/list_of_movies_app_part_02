import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_icons.dart';
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/screens/favorites_screen.dart';
import 'package:mvvm_state_management/services/init_getit.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';
import 'package:mvvm_state_management/widgets/movies/movie_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // Todo: Navigate to the favorites screen
              getIt<NavigationService>().navigator(FavoritesScreen());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FavoritesScreen()),
              // );
            },
            icon: const Icon(MyAppIcons.favoriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              List<MoviesModal> movies = await getIt<MoviesRepository>()
                  .fetchMovies();
              List<MoviesGenres> genres = await getIt<MoviesRepository>()
                  .fetchGenres();
              log("Movies :- \n$movies");
              log("Genres :- \n$genres");
            },
            icon: Icon(MyAppIcons.dartMode, color: Colors.grey),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
            return MovieWidget();
        },
      ),
    );
  }
}

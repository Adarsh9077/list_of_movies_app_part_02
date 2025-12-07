import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_constant.dart';
import 'package:mvvm_state_management/constants/my_theme_data.dart';
import 'package:mvvm_state_management/view_models/movies_provider.dart';
import 'package:mvvm_state_management/view_models/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_state_management/constants/my_app_icons.dart';
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/screens/favorites_screen.dart';
import 'package:mvvm_state_management/services/init_getit.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';
import 'package:mvvm_state_management/widgets/movies/movie_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    log("message Rebuild Build Widget");
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
          Consumer(
            builder: (context, ThemeProvider themeProvider, child) {
              log("message Rebuild Theme Icon btn");
              print("message Rebuild Theme Icon btn");
              return IconButton(
                onPressed: () async {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.themeData == MyThemeData.darkTheme
                      ? MyAppIcons.lightMode
                      : MyAppIcons.darkMode,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, MoviesProvider moviesProvider, child) {
          if (moviesProvider.isLoading && moviesProvider.moviesList.isEmpty) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (moviesProvider.fetchMoviesError.isNotEmpty) {
            return Center(child: Text(moviesProvider.fetchMoviesError));
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !moviesProvider.isLoading) {
                moviesProvider.getMovies();
                return true;
              }
              print("object");
              return false;
            },
            child: ListView.builder(
              itemCount: moviesProvider.moviesList.length,
              itemBuilder: (context, index) {
                return const MovieWidget();
              },
            ),
          );
        },
      ),
    );
  }
}

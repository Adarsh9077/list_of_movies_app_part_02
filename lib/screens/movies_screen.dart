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

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MoviesModal> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
      log("${_movies[0].voteAverage}");
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;
    });
    try {
      final List<MoviesModal> movies = await getIt<MoviesRepository>()
          .fetchMovies(page: _currentPage);
      log("message\n${movies.length}");
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (err) {
      getIt<NavigationService>().showSnackBar(
        "An Error has been occurred $err",
      );
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

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
        controller: _scrollController,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MovieWidget(moviesModal: _movies[index]);
          } else {
            return SizedBox(
                height: MediaQuery.of(context).size.height - 200,
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
        },
      ),
    );
  }
}

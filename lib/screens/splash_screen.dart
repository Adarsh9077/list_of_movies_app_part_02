import 'package:flutter/material.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/screens/movies_screen.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';
import 'package:mvvm_state_management/view_models/favorite_provider.dart';
import 'package:mvvm_state_management/view_models/movies_provider.dart';
import 'package:mvvm_state_management/widgets/my_error_widget.dart';
import 'package:provider/provider.dart';

import '../services/init_getit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  // bool _isLoading = false;
  // String _errorMessage = '';
  // final _moviesRepository = getIt<MoviesRepository>();

  // Future<void> _loadData() async {
  //   setState(() {
  //     _isLoading = true;
  //     _errorMessage = '';
  //   });
  //   try {
  //     await _moviesRepository.fetchGenres();
  //     getIt<NavigationService>().navigateReplace(const MoviesScreen());
  //   } catch (e) {
  //     setState(() {
  //       _errorMessage = e.toString();
  //     });
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
  // @override
  // void initState() {
  // Todo: implement initState
  //   super.initState();
  //   _loadData();
  // }
  Future<void> _loadInitialData(BuildContext context) async {
    await Future.microtask(() async {
      if (!context.mounted) return;
      await Provider.of<FavoriteProvider>(
        context,
        listen: false,
      ).loadFavorites();
      if (!context.mounted) return;
      await Provider.of<MoviesProvider>(context, listen: false).getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: _loadInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator.adaptive();
          } else if (snapshot.hasError) {
            if (moviesProvider.genresList.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<NavigationService>().navigateReplace(
                  const MoviesScreen(),
                );
              });
            }
            return Provider.of<MoviesProvider>(context).isLoading
                ? const CircularProgressIndicator.adaptive()
                : MyErrorWidget(
                    errorText: snapshot.error.toString(),
                    retryFunction: () {},
                  );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              getIt<NavigationService>().navigateReplace(const MoviesScreen());
            });
            return SizedBox.shrink();
          }
        },
      ),
      // body: true
      //     ? Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               "Loading...",
      //               style: TextStyle(
      //                 fontSize: 24,
      //                 color: Colors.grey[600],
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             SizedBox(height: 10),
      //             CircularProgressIndicator.adaptive(),
      //           ],
      //         ),
      //       )
      //     : MyErrorWidget(
      //         errorText: "_errorMessage",
      //         retryFunction: () {} /*_loadData*/,
      //       ),
    );
  }
}

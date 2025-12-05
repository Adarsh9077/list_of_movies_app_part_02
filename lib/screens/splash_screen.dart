import 'package:flutter/material.dart';
import 'package:mvvm_state_management/repository/movies_repository.dart';
import 'package:mvvm_state_management/screens/movies_screen.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';
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

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator.adaptive();
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

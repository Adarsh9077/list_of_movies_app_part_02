import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_constant.dart';
import 'package:mvvm_state_management/widgets/cached_image.dart';
import 'package:mvvm_state_management/widgets/movies/favorite_btn.dart';
import 'package:mvvm_state_management/widgets/movies/genres_list_widget.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key /*required this.moviesModel*/});

  // final MoviesModal moviesModel;

  @override
  Widget build(BuildContext context) {
    final moviesModelProvider = Provider.of<MoviesModal>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: moviesModelProvider.id,
              child: SizedBox(
                height: size.height * 0.45,
                width: double.infinity,
                child: CachedImageWidget(
                  imgUrl:
                      "https://image.tmdb.org/t/p/w500/${moviesModelProvider.backdropPath}",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.4),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  moviesModelProvider.title,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${moviesModelProvider.voteAverage.toStringAsFixed(1)}/10",
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          moviesModelProvider.releaseDate,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                GenresListWidget(
                                  moviesModal: moviesModelProvider,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  moviesModelProvider.overview,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    height: 1.75,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FavoriteBtnWidget(
                              moviesModal: moviesModelProvider
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_constant.dart';
import 'package:mvvm_state_management/constants/my_app_icons.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/screens/movie_details.dart';
import 'package:mvvm_state_management/services/init_getit.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';
import 'package:mvvm_state_management/view_models/movies_provider.dart';
import 'package:mvvm_state_management/widgets/movies/genres_list_widget.dart';
import 'package:provider/provider.dart';

import '../cached_image.dart';
import 'favorite_btn.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    //  required this.moviesModal
  });
  // final MoviesModal moviesModal;

  @override
  Widget build(BuildContext context) {
    final moviesModelProvider = Provider.of<MoviesModal>(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            getIt<NavigationService>().navigator(
              MovieDetailScreen(
                // moviesModel: moviesModal
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Hero(
                  //   tag: "", //moviesModal.id,
                  //   child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedImageWidget(
                      imgUrl:
                          "https://image.tmdb.org/t/p/w500/${moviesModelProvider.backdropPath}",
                    ),
                  ),
                  // ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          moviesModelProvider.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "${moviesModelProvider.voteAverage.toStringAsFixed(1)}/10",
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GenresListWidget(
                          // moviesModal: moviesModal
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watchLaterOutline,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              moviesModelProvider.releaseDate,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            FavoriteBtnWidget(
                              // moviesModal: moviesModal
                            ),
                            // Todo: Add the favorite button
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

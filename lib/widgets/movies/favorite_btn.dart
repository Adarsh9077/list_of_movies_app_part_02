import "package:flutter/material.dart";
import "package:mvvm_state_management/constants/my_app_icons.dart";
import "package:mvvm_state_management/models/movies_modal.dart";
import "package:mvvm_state_management/view_models/favorite_provider.dart";
import "package:provider/provider.dart";

class FavoriteBtnWidget extends StatelessWidget {
  final MoviesModal moviesModal;
  const FavoriteBtnWidget({super.key, required this.moviesModal});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FavoriteProvider favoriteProvider, child) {
        return IconButton(
          onPressed: () {
            favoriteProvider.addOrRemoveFromFavorites(moviesModal);
            // Todo: Add the favorite list
            // if (isFavorite) {
            //   favoritesMoviesIds.remove(widget.moviesModal.id);
            // } else {
            //   favoritesMoviesIds.add(widget.moviesModal.id);
            // }
            // setState(() {});
          },
          icon: Icon(
            favoriteProvider.isFavorite(moviesModal)
                ? MyAppIcons.favoriteRounded
                : MyAppIcons.favoriteOutlineRounded,
            color: favoriteProvider.isFavorite(moviesModal) ? Colors.red : null,
            size: 20,
          ),
        );
      },
    );
  }
}

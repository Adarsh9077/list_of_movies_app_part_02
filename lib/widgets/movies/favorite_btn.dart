import "package:flutter/material.dart";
import "package:mvvm_state_management/constants/my_app_icons.dart";
import "package:mvvm_state_management/models/movies_modal.dart";

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Todo: Add the favorite list
        // if (isFavorite) {
        //   favoritesMoviesIds.remove(widget.moviesModal.id);
        // } else {
        //   favoritesMoviesIds.add(widget.moviesModal.id);
        // }
        // setState(() {});
      },
      icon: Icon(
        MyAppIcons.favoriteOutlineRounded,
        color: null, //? isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}

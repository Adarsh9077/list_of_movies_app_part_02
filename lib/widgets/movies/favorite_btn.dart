import "package:flutter/material.dart";
import "package:mvvm_state_management/constants/my_app_icons.dart";
import "package:mvvm_state_management/models/movies_modal.dart";

class FavoriteBtnWidget extends StatefulWidget {
  const FavoriteBtnWidget({super.key, required this.moviesModal});
  final MoviesModal moviesModal;
  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {
  final favoritesMoviesIds = [];

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoritesMoviesIds.contains(widget.moviesModal.id);
    return IconButton(
      onPressed: () {
        // Todo: Add the favorite list
        if (isFavorite) {
          favoritesMoviesIds.remove(widget.moviesModal.id);
        } else {
          favoritesMoviesIds.add(widget.moviesModal.id);
        }
        setState(() {});
      },
      icon: Icon(
        isFavorite ? MyAppIcons.favorite : MyAppIcons.favoriteOutlineRounded,
        color: isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}

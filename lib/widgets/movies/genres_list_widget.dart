import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_constant.dart';
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';
import 'package:mvvm_state_management/utils/genres_utils.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key, required this.moviesModal});
  final MoviesModal moviesModal;
  @override
  Widget build(BuildContext context) {
    List<MoviesGenres> moviesGenres = GenresUtils.moviesGenresName(
      moviesModal.genreIds,
      context,
    );
    return Wrap(
      children: List.generate(
        moviesGenres.length,
        (index) =>
            chipWidget(genreName: moviesGenres[index].name, context: context),
      ),
      // [
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // chipWidget(genreName: "Horror", context: context),
      // ],
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

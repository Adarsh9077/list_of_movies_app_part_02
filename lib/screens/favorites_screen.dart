import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_icons.dart';
import 'package:mvvm_state_management/view_models/favorite_provider.dart';
import 'package:mvvm_state_management/widgets/movies/movie_widget.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        actions: [
          IconButton(
            onPressed: () {
              favoriteProvider.clearAllFavorite();
            },
            icon: Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
        centerTitle: true,
      ),
      body: favoriteProvider.favoritesList.isEmpty
          ? const Center(
              child: Text(
                "No add Favorites",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: favoriteProvider.favoritesList.length,
                itemBuilder: (context, index) {
                  return Builder(
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: favoriteProvider.favoritesList.reversed
                            .toList()[index],
                        child: MovieWidget(),
                      );
                    },
                  ); //Text("data");
                  //  MovieWidget()
                },
              ),
            ),
    );
  }
}
// 02:45
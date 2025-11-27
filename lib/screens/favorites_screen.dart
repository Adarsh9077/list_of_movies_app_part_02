import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_app_icons.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Text("data");
            //  MovieWidget()
          },
        ),
      ),
    );
  }
}

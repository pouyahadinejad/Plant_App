import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoitedplants;
  const FavoritePage({
    super.key,
    required this.favoitedplants,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("علاقه مندی ها"),
      ),
    );
  }
}

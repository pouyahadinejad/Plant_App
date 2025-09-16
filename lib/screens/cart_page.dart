import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCatPlants;
  const CartPage({
    super.key,
    required this.addedToCatPlants,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("سبد خرید"),
      ),
    );
  }
}

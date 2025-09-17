import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/extension.dart';
import 'package:plant_app/widgets/plant_widget.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCatPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "سبد خریدت تار عنکبوت بسته",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 30.0,
              ),
              // height: size.height * 0.5,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addedToCatPlants.length,
                      itemBuilder: (context, index) {
                        return NewPlantWidget(
                          plantList: widget.addedToCatPlants,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20.0,
                                child: Image.asset(
                                  "assets/images/PriceUnit-green.png",
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "33".farsiNumber,
                                style: TextStyle(
                                  color: Constans.primaryColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "جمع کل",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Constans.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}

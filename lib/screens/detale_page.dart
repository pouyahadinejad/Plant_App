import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/extension.dart';

class DetalePage extends StatefulWidget {
  final int plantId;
  const DetalePage({super.key, required this.plantId});

  @override
  State<DetalePage> createState() => _DetalePageState();
}

class _DetalePageState extends State<DetalePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constans.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constans.primaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constans.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constans.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 110.0,
                    left: 0.0,
                    child: SizedBox(
                        height: 300.0,
                        child: Image.asset(plantList[widget.plantId].imageURL)),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            plantFeature: "اندازه گیاه",
                            title: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            plantFeature: "رطوبت‌هوا",
                            title:
                                plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeature(
                            plantFeature: "دمای‌نگهداری",
                            title: plantList[widget.plantId].temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 30.0,
                right: 30.0,
              ),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constans.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constans.primaryColor,
                          ),
                          Text(
                            plantList[widget.plantId]
                                .rating
                                .toString()
                                .farsiNumber,
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Constans.primaryColor,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Constans.primaryColor,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/PriceUnit-green.png',
                                height: 20,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                plantList[widget.plantId]
                                    .price
                                    .toString()
                                    .farsiNumber,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Constans.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    textDirection: TextDirection.rtl,
                    plantList[widget.plantId].decription,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Constans.blackColor.withOpacity(0.7),
                      // fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      height: 1.7,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          plantFeature,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Constans.blackColor,
          ),
        ),
        Text(
          title.farsiNumber,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Constans.primaryColor,
          ),
        ),
      ],
    );
  }
}

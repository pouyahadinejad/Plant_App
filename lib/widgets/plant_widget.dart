import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detale_page.dart';
import 'package:plant_app/widgets/extension.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;

  const NewPlantWidget({
    super.key,
    required List<Plant> plantList,
    required this.index,
  }) : _plantList = plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetalePage(
                  plantId: _plantList[index].plantId,
                ),
                type: PageTransitionType.rightToLeft));
      },
      child: Container(
        height: 80.0,
        width: size.width,
        decoration: BoxDecoration(
          color: Constans.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.only(
          bottom: 10.0,
          top: 10.0,
        ),
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/PriceUnit-green.png',
                  height: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  _plantList[index].price.toString().farsiNumber,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Constans.primaryColor,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constans.primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        _plantList[index].plantName,
                        style: TextStyle(
                          fontSize: 18,
                          color: Constans.blackColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

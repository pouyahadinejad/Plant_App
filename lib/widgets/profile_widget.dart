import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';

class BuildOpetions extends StatelessWidget {
  final String title;
  final IconData icon;
  const BuildOpetions({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Constans.blackColor.withOpacity(0.4),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Constans.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5.0),
              Icon(
                icon,
                color: Constans.blackColor.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

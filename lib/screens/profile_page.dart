import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height,
        width: size.height,
        child: Column(
          children: [
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constans.primaryColor.withOpacity(0.5),
                  width: 5.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  "assets/images/profile.jpg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

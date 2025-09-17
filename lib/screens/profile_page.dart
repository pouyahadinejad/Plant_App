import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/widgets/profile_widget.dart';

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
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ساناز امینی",
                  style: TextStyle(
                    color: Constans.blackColor,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(width: 5.0),
                SizedBox(
                  height: 20.0,
                  child: Image.asset(
                    'assets/images/verified.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              'Sanaze@gmail.com',
              style: TextStyle(
                color: Constans.blackColor.withOpacity(0.4),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildOpetions(
                  icon: Icons.person,
                  title: "پروفایل من",
                ),
                BuildOpetions(
                  icon: Icons.settings,
                  title: "تنظیمات",
                ),
                BuildOpetions(
                  icon: Icons.notifications,
                  title: "اطلاع رسانی ها",
                ),
                BuildOpetions(
                  icon: Icons.share,
                  title: "شبکه های اجتماعی",
                ),
                BuildOpetions(
                  icon: Icons.logout,
                  title: "خروج",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

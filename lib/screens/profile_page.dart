import 'package:flutter/material.dart';

class ProfilePafe extends StatefulWidget {
  const ProfilePafe({super.key});

  @override
  State<ProfilePafe> createState() => _ProfilePafeState();
}

class _ProfilePafeState extends State<ProfilePafe> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("پروفایل کاربر"),
      ),
    );
  }
}

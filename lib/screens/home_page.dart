import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constans.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            showCursor: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5.0),
                              hintText: "جست‌جو...",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.mic,
                        color: Constans.primaryColor.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

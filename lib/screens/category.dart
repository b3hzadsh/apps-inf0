import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> cats = [
      "ART AND DESIGN",
      "FAMILY",
      "TOOLS",
      "NEWS AND MAGAZINES",
      "BUSINESS",
      "PRODUCTIVITY",
      "GAME",
      "LIFESTYLE",
      "SHOPPING",
      "HEALTH AND FITNESS",
      "BEAUTY",
      "VIDEO PLAYERS",
      "MUSIC",
      "COMMUNICATION",
      "PERSONALIZATION",
      "SOCIAL",
      "SPORTS",
    ];
    return Scaffold(
      // backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        elevation: 0.0,
        title: Hero(
          child: Text("Category"),
          tag: "CatHero",
        ),
      ),
      body: MyBlurBg(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: List<Widget>.generate(
              cats.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/cat/${cats[index]}");
                },
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                cats[index],
                                style: TextStyle(
                                    color: Colors.grey[200], fontSize: 20),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

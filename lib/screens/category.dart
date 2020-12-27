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
      "AUTO_AND_VEHICLES",
      "BEAUTY",
      "BOOKS_AND_REFERENCE",
      "BUSINESS",
      "COMMUNICATION",
      "COMICS",
      "DATING",
      "EDUCATION",
      "ENTERTAINMENT",
      "EVENTS",
      "FINANCE",
      "FOOD_AND_DRINK",
      "FAMILY",
      "GAME",
      "HEALTH AND FITNESS",
      "LIFESTYLE",
      "LIBRARIES_AND_DEMO",
      "MAPS_AND_NAVIGATION",
      "MEDICAL",
      "MUSIC",
      "NEWS AND MAGAZINES",
      "PRODUCTIVITY",
      "PERSONALIZATION",
      "PARENTING",
      "SHOPPING",
      "SOCIAL",
      "SPORTS",
      "TOOLS",
      "TRAVEL_AND_LOCAL",
      "VIDEO PLAYERS",
      "WEATHER"
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

import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> cats = [
      "ART_AND_DESIGN",
      "FAMILY",
      "TOOLS",
      "NEWS_AND_MAGAZINES",
      "BUSINESS",
      "PRODUCTIVITY",
      "GAME",
      "LIFESTYLE",
      "HOUSE_AND_HOME",
      "SHOPPING",
      "HEALTH_AND_FITNESS",
      "BEAUTY",
      "VIDEO_PLAYERS",
      "PHOTOGRAPHY",
      "MUSIC",
      "COMMUNICATION",
      "PERSONALIZATION",
      "SOCIAL",
      "SPORTS",
      "AUTO_AND_VEHICLES",
      "BOOKS_AND_REFERENCE",
      "COMICS",
      "DATING",
      "EDUCATION",
      "ENTERTAINMENT",
      "EVENTS",
      "FINANCE",
      "FOOD_AND_DRINK",
      "LIBRARIES_AND_DEMO",
      "MAPS_AND_NAVIGATION",
      "MEDICAL",
      "PARENTING",
      "TRAVEL_AND_LOCAL",
      "WEATHER",
      "Favorites"
    ];
    cats.sort(); //..sort((a, b) => a.substring(0, 1).compareTo(b.substring(0, 1)));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Category"),
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
                                cats[index].replaceAll("_", " "),
                                style: TextStyle(
                                  color: Color(0xFFD5DFE5),
                                  fontSize: 20,
                                ),
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

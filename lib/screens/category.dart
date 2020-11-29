import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        elevation: 0.0,
        title: Hero(
          child: Text("Category"),
          tag: "CatHero",
        ),
      ),
      body: ListView(
        children: List<Widget>.generate(
          cats.length,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 1 / 100 * hieght, bottom: 1 / 100 * hieght),
                  child: Column(
                    children: [
                      Text(
                        cats[index],
                        style: TextStyle(color: Colors.grey[800], fontSize: 20),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

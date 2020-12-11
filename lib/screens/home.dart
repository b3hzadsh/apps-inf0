import 'dart:ui' as ui;
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Container(
                color: Colors.blue,
                child: ClipPath(
            clipper: CurveClipper(),
            child: Image(
              image: AssetImage("assets/images/avatar.jpg"),
              height: MediaQuery.of(context).size.height / 3.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
                ),
              ), */

            Expanded(
              child: Container(
                width: double.infinity,
                child: MyBlurBg(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Opacity(
                      opacity: 0.98,
                      child: Wrap(
                        runSpacing: 2 / 100 * hieght,
                        spacing: 2 / 100 * width,
                        direction: Axis.horizontal,
                        children: [
                          Hero(
                            tag: "CatHero",
                            child: MainButton(
                                title: "Category", icon: Icons.category),
                          ),
                          MainButton(title: "Favorites", icon: Icons.favorite),
                          MainButton(title: "Search", icon: Icons.search),
                          MainButton(title: "Setting", icon: Icons.settings),
                          MainButton(title: "About", icon: Icons.info),
                          MainButton(title: "Exit", icon: Icons.exit_to_app),
                        ],
                      ),
                    ),
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

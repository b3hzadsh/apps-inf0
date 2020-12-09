import 'package:apps_info/utils/path.dart';
import 'dart:ui' as ui;
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      // backgroundColor: Colors.blueGrey[300],
      /* appBar: AppBar(
        title: Text("widget.title"),
      ), */
      body: SafeArea(
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
            /*  Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: hieght / 7,
            decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
            ),
            child: Wrap(
        children: [

        ],
            ),
          ), */
            Expanded(
              child: Container(
                //color: Color(0xff23B5D3),
                width: double.infinity,
                /* decoration: BoxDecoration(
          /* image: DecorationImage(
        image: AssetImage(),
        fit: BoxFit.cover,
          ), */
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
          ),
        ), */
                child: Stack(
                  // fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        //width: double.infinity,
                        child: Image.asset(
                          "assets/images/wolf.jpg",
                          fit: BoxFit.cover,
                        )
                        /* SvgPicture.asset(
                          "assets/images/Large-Triangles.svg",
                          height: hieght,
                          alignment: Alignment.bottomRight,
                          width: width,
                          fit: BoxFit.fill,
                        ), */
                        ),
                    BackdropFilter(
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey.shade500.withOpacity(0.25),
                        ),
                        width: width,
                        height: hieght,
                      ),
                      filter: ui.ImageFilter.blur(
                        sigmaX: 12.0,
                        sigmaY: 11.8,
                      ),
                    ),
                    Padding(
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
                                  width: width,
                                  hieght: hieght,
                                  title: "category",
                                  icon: Icons.category),
                            ),
                            MainButton(
                                width: width,
                                hieght: hieght,
                                title: "favorites",
                                icon: Icons.favorite),
                            MainButton(
                                width: width,
                                hieght: hieght,
                                title: "search",
                                icon: Icons.search),
                            MainButton(
                                width: width,
                                hieght: hieght,
                                title: "setting",
                                icon: Icons.settings),
                            MainButton(
                                width: width,
                                hieght: hieght,
                                title: "about",
                                icon: Icons.info),
                            MainButton(
                                width: width,
                                hieght: hieght,
                                title: "exit",
                                icon: Icons.exit_to_app),
                          ],
                        ),
                      ),
                    ),
                    /*
        Positioned(
          //top: -hieght / 12,
          left: width / 1.8,
          child: Opacity(
            opacity: 0.4,
            child: Container(
              //width: double.infinity,
              child: SvgPicture.asset(
                "assets/images/bxl-android.svg",
                height: hieght / 1.7,
                alignment: Alignment.bottomRight,
                // width: width,
                color: Colors.yellow,
                // fit: BoxFit.cover,
                semanticsLabel: 'Acme Logo',
              ),
            ),
          ),
        ), */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

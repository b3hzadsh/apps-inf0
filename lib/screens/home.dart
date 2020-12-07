import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: hieght / 5,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Wrap(
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
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                /* runSpacing: 3 / 100 * hieght,
                spacing: 3 / 100 * width,
                direction: Axis.horizontal, */
                children: [
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
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: hieght / 5,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.width,
    @required this.hieght,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final double width;
  final double hieght;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght / 8,
      width: width / 2.5,
      child: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, "/screen/$title");
          },
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    icon,
                    size: 25,
                    color: Theme.of(context).textTheme.headline1.color,
                  )
                ],
              ),
            ),
            height: hieght / 8,
            width: width / 2.5,
          ),
        ),
      ),
    );
  }
}

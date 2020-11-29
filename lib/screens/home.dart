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
      backgroundColor: Colors.blueGrey[300],
      /* appBar: AppBar(
        title: Text(widget.title),
      ), */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              runSpacing: 3 / 100 * hieght,
              spacing: 3 / 100 * width,
              direction: Axis.horizontal,
              children: [
                Hero(
                    tag: "CatHero",
                    child: MainButton(
                        width: width, hieght: hieght, title: "category")),
                MainButton(width: width, hieght: hieght, title: "search"),
                MainButton(width: width, hieght: hieght, title: "setting"),
                MainButton(width: width, hieght: hieght, title: "about"),
              ],
            ),
            SizedBox(
              height: 4 / 100 * width,
            ),
            MainButton(width: width, hieght: hieght, title: "exit"),
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
  }) : super(key: key);

  final double width;
  final double hieght;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 30),
      child: Container(
        height: hieght / 4,
        width: width / 2.5,
        /* decoration: BoxDecoration(

            // borderRadius: BorderRadius.circular(width / 30),
            ), */
        child: Center(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, "/screen/$title");
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

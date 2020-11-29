import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ), */
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              decoration: BoxDecoration(color: Colors.grey[700]),
              child: Hero(
                tag: "SearchHero",
                child: TextField(
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    labelText: "Search App",
                  ),
                  //controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

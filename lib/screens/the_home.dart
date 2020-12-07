import 'package:apps_info/utils/path.dart';
import 'package:flutter/material.dart';

class MyDamnHome extends StatefulWidget {
  @override
  _MyDamnHomeState createState() => _MyDamnHomeState();
}

class _MyDamnHomeState extends State<MyDamnHome> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.pushNamed(context, "/screen/search");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.,
        onTap: (int index) {
          onTabTapped(index);
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/screen/category");

              break;
            case 1:
              Navigator.pushNamed(context, "/screen/favorite");

              break;
          }
        },
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.category_sharp),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  image: AssetImage("assets/images/avatar.jpg"),
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

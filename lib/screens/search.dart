import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blueGrey[300],
      /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ), */
      body: SafeArea(
          bottom: false,
          child: MyBlurBg(
            child: Column(
              children: [
                Container(
                  // alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(10, 2, 10, 0),

                  child: TextField(
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                      border: InputBorder.none,
                      //labelText: "Search App",
                      hintText: "App Name ❤️❤",
                    ),
                    //controller: controller,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

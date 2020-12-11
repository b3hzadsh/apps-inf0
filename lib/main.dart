import 'package:apps_info/screens/art_cat_screen.dart';
import 'package:apps_info/screens/category.dart';
import 'package:apps_info/screens/home.dart';
import 'package:apps_info/screens/search.dart';
import 'package:apps_info/screens/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "VAGROUND"),
      debugShowCheckedModeBanner: false,
      title: 'Apps info',
      // home: MyHomePage(),
      onGenerateRoute: (RouteSettings setting) {
        // create some route for every page and pushed named
        if (setting.name == "/") // for home
          return MaterialPageRoute(
            builder: (context) => MyHomePage(),
            // bring splash screen at startup
          );
        if (setting.name == "/screen/Search") // for home
          return MaterialPageRoute(
            builder: (context) => SearchScreen(),
            // bring choosing cat screen to user
          );

        if (setting.name == "/screen/Category") // for home
          return MaterialPageRoute(
            builder: (context) => CategoryScreen(),
            // bring home
          );
        if (setting.name == "/cat/ART AND DESIGN") // for home
          return MaterialPageRoute(
            builder: (context) => ArtScreen(),
            // bring home
          );
        if (setting.name == "/screen/Setting") // for home
          return MaterialPageRoute(
            builder: (context) => SettingScreen(),
            // bring home
          );
      },
      /* theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'B',
        primarySwatch: Colors.blue,
        accentColor: Color(0XFFFF4081), //
        scaffoldBackgroundColor: Color(0XFFC5CAE9),
        //backgroundColor: Color(0XFFBBDEFB),
        primaryColor: Color(0XFF448AFF), //
        primaryColorLight: Color(0XFFFFCDD2), //
        primaryColorDark: Color(0XFFD32F2F), //
        dividerColor: Color(0XFFBDBDBD), //
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0XFF212121), //
            fontFamily: "C",
          ),
          caption: TextStyle(
            color: Color(0XFF212121),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Color(0XFFFFFFFF)),
          headline6: TextStyle(color: Color(0XFFFFFFFF)),
          subtitle1: TextStyle(color: Color(0XFF757575)),
        ),
      ),*/
    );
  }
}

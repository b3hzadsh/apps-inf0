import 'package:apps_info/screens/cat_screen.dart';
import 'package:apps_info/screens/category.dart';
import 'package:apps_info/screens/favorite_screen.dart';
import 'package:apps_info/screens/home.dart';
import 'package:apps_info/screens/search.dart';
import 'package:apps_info/screens/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "VAGROUND",
      ),
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
        if (setting.name == "/screen/Favorites") // for home
          return MaterialPageRoute(
            builder: (context) => FavoriteScreen(),
            // bring home
          );

        if (setting.name == "/screen/Setting") // for home
          return MaterialPageRoute(
            builder: (context) => SettingScreen(),
            // bring home
          );
        // for home
        return MaterialPageRoute(
          builder: (context) => CatScreen(
            catName: setting.name.substring(5),
          ),
          // bring home
        );
      },
    );
  }
}

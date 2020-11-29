import 'package:apps_info/screens/home.dart';
import 'package:apps_info/screens/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apps info',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(),
      onGenerateRoute: (RouteSettings setting) {
        // create some route for every page and pushed named
        if (setting.name == "/") // for home
          return MaterialPageRoute(
            builder: (context) => MyHomePage(),
            // bring splash screen at startup
          );
        if (setting.name == "/screen/search") // for home
          return MaterialPageRoute(
            builder: (context) => SearchScreen(),
            // bring choosing cat screen to user
          );
        /*
        if (setting.name == "/screen/home") // for home
          return MaterialPageRoute(
            builder: (context) => Home(),
            // bring home
          ); */
      },
    );
  }
}

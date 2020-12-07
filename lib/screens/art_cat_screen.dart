import 'package:flutter/material.dart';

class ArtScreen extends StatefulWidget {
  @override
  _ArtScreenState createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ART AND DESIGN"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [Icon(Icons.favorite), Text("App name")],
                  ),
                  Row(
                    children: [Icon(Icons.android)],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SafeArea(
        child: ListView.builder(
          // wrap with future builder
          // itemCount: ,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [AppWidget(), Divider()],
            );
          },
        ),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  //add require to vars
  final String appName;
  final String verNumber;
  final String size;
  final String downloads;
  final double ratting;
  final String price;
  const AppWidget({
    this.appName,
    this.verNumber,
    this.size,
    this.downloads,
    this.ratting,
    this.price,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var oneP = width / 100;
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(oneP * 5, oneP * 3, oneP * 5, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "App name",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w900,
            ),
            //size big with factor
          ),
          Divider(
            color: Colors.transparent,
          ),

          Text(
            "Version number",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "Size",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
            ),
          ),

          //size big with factor

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Downloads",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ratting"),
                  Icon(
                    Icons.star,
                    size: 20, // responsive size
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

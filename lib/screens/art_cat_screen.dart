import 'package:apps_info/models/app_model.dart';
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
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            AppModel theApp = new AppModel(
                review: 3,
                verNumber: "0.1.0",
                appName: "kelid khabar",
                ratting: 4.6,
                price: "free",
                downloads: "10+",
                size: "5 MB");
            return Column(
              children: [
                AppWidget(app: theApp),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  //add require to vars

  final AppModel app;

  const AppWidget({
    @required this.app,
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
            app.appName,

            //size big with factor
          ),
          Divider(
            color: Colors.transparent,
          ),

          /*  Text(
            "version : ${app.verNumber}",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "size : ${app.size}",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
            ),
          ), */

          //size big with factor

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: oneP * 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${app.ratting}",
                          ),
                          SizedBox(
                            width: oneP,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.orangeAccent,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: oneP,
                      ),
                      Text(
                        "${app.review} review", //TODO review var in app model
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  color: Colors.white,
                ),
                Container(
                  width: oneP * 18,
                  height: oneP * 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.download_rounded),
                      SizedBox(
                        height: oneP,
                      ),
                      Text(
                        "${app.size}",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: oneP * 2,
                  child: VerticalDivider(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: oneP * 12,
                  height: oneP * 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.android_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: oneP,
                      ),
                      Text(
                        "${app.verNumber}",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: oneP * 2,
                ),
                Container(
                  width: oneP * 19,
                  height: oneP * 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${app.downloads}",
                      ),
                      SizedBox(
                        height: oneP,
                      ),
                      Text(
                        "Downloads",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: oneP * 7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

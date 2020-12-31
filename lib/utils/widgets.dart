import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/func.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show ImageFilter;

import 'database.dart';

class MyBlurBg extends StatelessWidget {
  final Widget child;
  MyBlurBg({this.child});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // width: double.infinity,
          //width: double.infinity,
          child: Image.asset(
            "assets/images/wolf.jpg",
            //fit: BoxFit.fill,
          ),
        ),
        BackdropFilter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade500.withOpacity(0.20),
            ), /* 
            width: double.infinity,
            height: hieght * 1.1, */
            //height: hieght,
          ),
          filter: ui.ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
        ),
        child,
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  MainButton({
    Key key,
    // this.myfunc,
    this.needRout,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  //final Function myfunc;
  final bool needRout;

  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [
              Color(0xfff6d365),
              Color(0xfffda085),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 0.6,
              color: Colors.black.withOpacity(0.25),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.white.withOpacity(0.4)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        height: hieght / 9,
        width: double.infinity,
        child: Center(
          child: FlatButton(
            onPressed: () {
              if (needRout != false)
                Navigator.pushNamed(context, "/screen/$title");

              // myfunc();
            },
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff031926),
                    ),
                  ),
                  Icon(icon, size: 25, color: Color(0xff031926))
                ],
              ),
              height: hieght / 8,
              //width: width / 2.5,
            ),
          ),
        ),
      ),
    );
  }
}

class AppWidget extends StatefulWidget {
  //add require to vars
  final bool isFavorite;

  final AppModel app;

  const AppWidget({Key key, this.isFavorite, this.app}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool tempIsFavorite;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempIsFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    // var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    widget.app.size.substring(0, 3);
    var oneP = width / 100;
    return Container(
      //color: Theme.of(context).primaryColorDark,
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(oneP * 3, oneP * 3, oneP * 3, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${shortenerName(widget.app.appName)}",
                style: TextStyle(color: Colors.orange),

                //size big with factor
              ),
              IconButton(
                onPressed: () async {
                  tempIsFavorite = !tempIsFavorite;
                  var appList = await DBProvider.db.getAllClients("Favorites");
                  if (tempIsFavorite == true) {
                    if (!appList.contains(widget.app)) {
                      await DBProvider.db.addApp(widget.app, "Favorites");
                    }
                  } else if (tempIsFavorite == false) {
                    await DBProvider.db
                        .deleteApp(widget.app.appName, "Favorites");
                  }

                  setState(() {});
                },
                icon: Icon(
                  Icons.favorite,
                  color: tempIsFavorite
                      ? Color.fromRGBO(255, 200, 0, 1)
                      : Colors.grey,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.transparent,
          ),
          //size big with factor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: oneP * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.app.ratting}",
                        ),
                        SizedBox(
                          width: oneP,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: oneP,
                    ),
                    Text(
                      "${sumrize(widget.app.review)}" +
                          " review", //TODO review var in app model
                    )
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.white,
              ),
              Container(
                width: oneP * 15,
                height: oneP * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.download_rounded),
                    SizedBox(
                      height: oneP,
                    ),
                    Text(
                      "${shortener(widget.app.size)}",
                    )
                  ],
                ),
              ),
              SizedBox(
                width: oneP * 1,
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Container(
                width: oneP * 13,
                height: oneP * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.android_outlined, //version
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: oneP,
                    ),
                    Text(
                      "${widget.app.verNumber}",
                    )
                  ],
                ),
              ),
              SizedBox(
                width: oneP * 1,
              ),
              Container(
                width: oneP * 23,
                height: oneP * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${widget.app.installs}",
                    ),
                    SizedBox(
                      height: oneP,
                    ),
                    Text(
                      "Dl",
                    )
                  ],
                ),
              ),
              SizedBox(
                width: oneP * 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/func.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/database.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String title = "setting";

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(title), //Text("Setting"),
        ),
        body: MyBlurBg(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: MainButton(
                  needRout: false,
                  title: "Download dataset",
                  icon: Icons.download_rounded,
                  myfunc: () async {
                    DBProvider.db.deleteAllTables();
                    List x;
                    //if for check thats for first time
                    String url =
                        "https://api.jsonbin.io/b/5fe6de6f6c160b7b70d98be1";

                    String giturl =
                        "https://raw.githubusercontent.com/b3hzadsh/json/master/small_dataset.json";
                    try {
                      http.Response res = await http.get(giturl);
                      x = json.decode(res.body);
                      print(x[1]["App"]);
                      title = x[1]["App"];
                    } catch (e) {
                      print(e);
                    }

                    for (int i = 0; i < x.length; i++) {
                      var verTemp = remEnd(x[i]["Android Ver"]);
                      AppModel newApp = new AppModel(
                        appName: x[i]["App"],
                        ratting: x[i]["Rating"],
                        review: x[i]["Reviews"],
                        size: x[i]["Size"],
                        installs: x[i]
                            ["Installs"], //conacat to int :rem + and ,
                        price:
                            "${x[i]["Price"]}", // change to X $ , it may have $
                        verNumber: "$verTemp",
                      );
                      DBProvider.db.addApp(newApp, x[i]["Category"]);
                    }
                    setState(() {});

                    // list of map
                  },
                ),
              )
            ],
          ),
        )
        // child: child,
        );
  }
}

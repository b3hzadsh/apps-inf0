import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/func.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                child: Center(
                  child: RaisedButton(
                      onPressed: () async {
                        await DBProvider.db.deleteAllTables();
                        List x; //<Map<String, dynamic>>
                        //if for check thats for first time
                        for (int j = 1; j <= 20; j++) {
                          // change 395
                          String splitGitUrl =
                              "https://raw.githubusercontent.com/b3hzadsh/json/master/split/dataset_$j.json";
                          try {
                            http.Response res = await http.get(splitGitUrl);
                            x = json.decode(res.body);
                            // as List<Map<String, dynamic>>;
                            //x.sublist(0, 100);
                            print(x[1]["App"]);
                            title = x[1]["App"];
                          } catch (e) {
                            print(e);
                          }
                          //var xlen = x.length ~/ 100;
                          //for (int j = 0; j < 99 * xlen; j += xlen) {
                          for (int i = 0; i < x.length - 1; i++) {
                            var verTemp = remEnd(x[i]["Android Ver"]);
                            AppModel newApp = AppModel(
                              appName: x[i]["App"],
                              ratting: ((x[i]["Rating"]) != "NaN")
                                  ? "${x[i]["Rating"]}"
                                  : "0",
                              review: x[i]["Reviews"],
                              size: x[i]["Size"],
                              installs: x[i]
                                  ["Installs"], //conacat to int :rem + and ,
                              price:
                                  "${x[i]["Price"]}", // change to X $ , it may have $
                              verNumber: "$verTemp",
                            );
                            await DBProvider.db
                                .addApp(newApp, x[i]["Category"]);
                          }

                          ////
                          ///
                        }

                        setState(() {});

                        // list of map
                      },
                      child: Text("Download dataset")
                      /* MainButton(
                        needRout: false,
                        title: "Download dataset",
                        icon: Icons.download_rounded,
                      ) */
                      /*MainButton( 
                  needRout: false,
                  title: "Download dataset",
                  icon: Icons.download_rounded,
                  myfunc: () async {
                    await DBProvider.db.deleteAllTables();
                    List<Map<String, dynamic>> x;
                    //if for check thats for first time

                    String giturl =
                        "https://raw.githubusercontent.com/b3hzadsh/json/master/1.json";
                    String splitGitUrl =
                        "https://raw.githubusercontent.com/b3hzadsh/json/master/split/dataset_7.json";
                    try {
                      http.Response res = await http.get(splitGitUrl);
                      x = json.decode(res.body);
                      //x.sublist(0, 100);
                      print(x[1]["App"]);
                      title = x[1]["App"];
                    } catch (e) {
                      print(e);
                    }
                    //var xlen = x.length ~/ 100;
                    //for (int j = 0; j < 99 * xlen; j += xlen) {
                    for (int i = 0; i < x.length - 1; i++) {
                      var verTemp = remEnd(x[i]["Android Ver"]);
                      AppModel newApp = AppModel(
                        appName: x[i]["App"],
                        ratting: "${x[i]["Rating"]}",
                        review: x[i]["Reviews"],
                        size: x[i]["Size"],
                        installs: x[i]
                            ["Installs"], //conacat to int :rem + and ,
                        price:
                            "${x[i]["Price"]}", // change to X $ , it may have $
                        verNumber: "$verTemp",
                      );
                      await DBProvider.db.addApp(newApp, x[i]["Category"]);
                    }

                    ////
                    ///
                    setState(() {});

                    // list of map
                  },
                 */
                      ),
                ),
              ),
            ],
          ),
        )
        // child: child,
        );
  }
}

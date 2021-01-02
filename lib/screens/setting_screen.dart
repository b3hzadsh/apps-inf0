import 'dart:async';

import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/func.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'
    show SpinKitPouringHourglass;
import 'dart:convert' show json;
import 'package:http/http.dart' as http show Response, get;
import '../utils/database.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String title = "setting";
  @override
  void dispose() {
    super.dispose();
  }

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
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Center(
                  child: RaisedButton(
                      onPressed: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //new CircularProgressIndicator(),
                                    SpinKitPouringHourglass(
                                      color: Colors.white,
                                      size: width / 3, //50.0
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                          await DBProvider.db.deleteAllTables();
                          List x; //<Map<String, dynamic>>
                          //if for check thats for first time
                          for (int j = 1; j <= 5; j++) {
                            Future.delayed(
                                const Duration(milliseconds: 300), () => "1");

                            String splitGitUrl =
                                "https://raw.githubusercontent.com/b3hzadsh/json/master/splited/dataset_$j.json";
                            try {
                              http.Response res = await http.get(splitGitUrl);
                              x = json.decode(res.body);

                              print(x[1]["App"]);
                            } catch (e) {
                              print(e);
                            }
                            for (int i = 0; i < x.length - 1; i++) {
                              var verTemp =
                                  MyFunctions.remEnd(x[i]["Android Ver"]);
                              AppModel newApp = AppModel(
                                appName: x[i]["App"],
                                ratting: ((x[i]["Rating"]) != "NaN")
                                    ? "${x[i]["Rating"]}"
                                    : "0",
                                review: x[i]["Reviews"],
                                size: x[i]["Size"],
                                installs: x[i]["Installs"],
                                price: "${x[i]["Price"]}",
                                verNumber: "$verTemp",
                                //isFavorite: false,
                              );
                              await DBProvider.db
                                  .addApp(newApp, x[i]["Category"]);
                            }
                          }
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              insetPadding: EdgeInsets.symmetric(horizontal: 1),
                              // backgroundColor: Colors.red,
                              title: Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                              // backgroundColor: Colors.blue,
                              content: Text("Dataset successfully downloaded"),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              insetPadding: EdgeInsets.symmetric(horizontal: 1),
                              // backgroundColor: Colors.red,
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                  Text(" error"),
                                ],
                              ),
                              // backgroundColor: Colors.blue,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "You are offline",
                                  ),
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
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

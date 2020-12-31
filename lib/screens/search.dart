import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/database.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchBoxController = new TextEditingController();
  bool searchTouch = false;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //  backgroundColor: Colors.blueGrey[300],
      /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ), */
      body: SafeArea(
          bottom: false,
          child: MyBlurBg(
            child: Column(
              children: [
                Container(
                  height: mq.height / 10 * 0.8,
                  // alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(10, 2, 10, 0),

                  child: TextField(
                    controller: searchBoxController,
                    onSubmitted: (input) {
                      setState(() {
                        searchTouch = true;
                      });
                    },
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                      border: InputBorder.none,
                      //labelText: "Search App",
                      hintText: "❤️ App Name ❤",
                    ),
                    //controller: controller,
                  ),
                ),
                if (searchTouch)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: FutureBuilder(
                      future: DBProvider.db
                          .searchApp(searchBoxController.value.text),
                      //initialData: InitialData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: mq.height / 10 * 7,
                              child: ListView.builder(
                                /* addAutomaticKeepAlives:
                                    true, // important to pass heap memory
                                primary: true, */
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var v = snapshot.data[index];
                                  AppModel theApp = AppModel(
                                    appName: v.appName,
                                    ratting: (v.ratting == "0.0")
                                        ? "unknown"
                                        : v.ratting,
                                    review: v.review,
                                    size: v.size,
                                    installs: v.installs,
                                    price: v.price,
                                    //price: v.price,
                                    verNumber: v.verNumber,
                                  );
                                  /* AppModel theApp = appModelFromJson(
                        appModelToJson(
                              snapshot.data[index],
                        ),
                      ); */
                                  return Column(
                                    children: [
                                      AppWidget(
                                        app: theApp,
                                        isFavorite: false,
                                      ),
                                      Divider(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        //return ;
                      },
                    ),
                  )
                else
                  Center(),
              ],
            ),
          )),
    );
  }
}

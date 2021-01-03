import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/database.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  final String catName;

  const CatScreen({Key key, @required this.catName}) : super(key: key);
  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catName.replaceAll("_", " ")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<AppModel>>(
            future: DBProvider.db.getAllClients("${widget.catName}"),
            //initialData: InitialData,
            builder:
                (BuildContext context, AsyncSnapshot<List<AppModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  addAutomaticKeepAlives: true, // important to pass heap memory
                  primary: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var v = snapshot.data[index];
                    AppModel theApp = AppModel(
                      appName: v.appName,
                      ratting: (v.ratting == "0") ? "unknown" : v.ratting,
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
                );
              } else {
                return Column(
                  //c

                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                );
              }
              //return ;
            },
          ),
        ),
      ),
    );
  }
}

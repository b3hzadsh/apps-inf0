import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/database.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  // final String catName;

  const FavoriteScreen({Key key}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              tooltip: "Delete all favorite apps",
              onPressed: () async {
                await DBProvider.db.deleteAll("Favorites");
                setState(() {});
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<AppModel>>(
            future: DBProvider.db.getAllClients("Favorites"),
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
                      ratting: (v.ratting == "0.0") ? "unknown" : v.ratting,
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
                    return Dismissible(
                      onDismissed: (_) async {
                        setState(() async {
                          await DBProvider.db
                              .deleteApp(theApp.appName, "Favorites");
                        });
                      },
                      key: Key(theApp.appName),
                      child: Column(
                        children: [
                          AppWidget(app: theApp),
                          Divider(),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return ListView(
                  // wrap with future builder
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

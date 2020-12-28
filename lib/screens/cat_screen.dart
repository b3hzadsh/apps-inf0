import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/database.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatefulWidget {
  final String catName;

  const CatScreen({Key key, this.catName}) : super(key: key);
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
                  itemCount: snapshot.data.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    AppModel theApp = AppModel(
                      appName: snapshot.data[index].appName,
                      ratting: snapshot.data[index].ratting,
                      review: snapshot.data[index].review,
                      size: snapshot.data[index].size,
                      installs: snapshot.data[index].installs,
                      price: snapshot.data[index].price,
                      verNumber: snapshot.data[index].verNumber,
                    );
                    /* AppModel theApp = appModelFromJson(
                      appModelToJson(
                        snapshot.data[index],
                      ),
                    ); */
                    return Column(
                      children: [
                        AppWidget(app: theApp),
                        Divider(),
                      ],
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

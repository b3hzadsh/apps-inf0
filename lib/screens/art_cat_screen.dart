import 'package:apps_info/models/app_model.dart';
import 'package:apps_info/utils/database.dart';
import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<AppModel>>(
            future: DBProvider.db.getAllClients("ART_AND_DESIGN"),
            //initialData: InitialData,
            builder:
                (BuildContext context, AsyncSnapshot<List<AppModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // wrap with future builder
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    AppModel theApp = new AppModel(
                        appName: snapshot.data[index].appName,
                        ratting: snapshot.data[index].ratting,
                        review: snapshot.data[index].review,
                        size: snapshot.data[index].size,
                        installs: snapshot.data[index].installs,
                        price: snapshot.data[index].price,
                        verNumber: snapshot.data[index].verNumber);
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
                return ListView.builder(
                  // wrap with future builder
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    AppModel theApp = new AppModel(
                        review: 3,
                        verNumber: "0.1.0",
                        appName: "kelid khabar",
                        ratting: 4.6,
                        price: "free",
                        installs: "10+",
                        size: "5 MB");
                    return Column(
                      children: [
                        AppWidget(app: theApp),
                        Divider(),
                      ],
                    );
                  },
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

import 'package:apps_info/utils/widgets.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: MyBlurBg(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: MainButton(
                  title: "Download dataset",
                  icon: Icons.download_rounded,
                ),
              )
            ],
          ),
        )
        // child: child,
        );
  }
}

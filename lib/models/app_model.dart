import 'package:flutter/cupertino.dart';
import 'dart:convert';

AppModel appModelFromJson(String str) {
  final jsonData = json.decode(str);
  return AppModel.fromMap(jsonData);
}

String appModelToJson(AppModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class AppModel {
  final String appName; //App
  final String verNumber; //android req
  final String size; //
  final String installs;
  final dynamic ratting;
  //final dynamic ratingTemp ;
  final String price; // 0 or 4.5 $
  final int review; //+
  AppModel({
    @required this.appName,
    @required this.verNumber,
    @required this.size,
    @required this.installs,
    @required this.ratting,
    @required this.price,
    @required this.review,
    //@required this.ratingTemp,
  });

  Map<String, dynamic> toMap() => {
        "app_name": appName,
        "ver_number": verNumber,
        "size": size,
        "installs": installs,
        "ratting": ratting,
        "price": price,
        "review": review,
      };
  factory AppModel.fromMap(Map<String, dynamic> json) => new AppModel(
        appName: json["app_name"],
        verNumber: json["ver_number"],
        size: json["size"],
        installs: json["installs"],
        ratting: double.parse(json["ratting"]),
        price: json["price"],
        review: json["review"],

        // lastName: json["last_name"],
      );
}

/*
{
    "App": "Instagram",
    "Category": "SOCIAL",  think 
    "Rating": 4.5,
    "Reviews": 66577313,
    "Size": "Varies with device",
    "Installs": "1,000,000,000+",
    "Type": "Free",
    "Price": 0,
    "Content Rating": "Teen",
    "Genres": "Social",
    "Last Updated": "July 31, 2018",
    "Current Ver": "Varies with device",
    "Android Ver": "Varies with device"
  },
  */

import 'package:flutter/cupertino.dart';

class AppModel {
  final String appName; //App
  final String verNumber;
  final String size; //
  final String downloads;
  final double ratting; //
  final String price;
  final int review;
  AppModel(
      {@required this.appName,
      @required this.verNumber,
      @required this.size,
      @required this.downloads,
      @required this.ratting,
      @required this.price,
      @required this.review});
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

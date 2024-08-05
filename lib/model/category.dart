import 'dart:ui';
import 'package:news_app/my_theme.dart';

class Categoryy {
  String id;
  String title;
  Color color;
  String imageUrl;

  Categoryy(
      {required this.color,
      required this.id,
      required this.imageUrl,
      required this.title});

  static List<Categoryy> getCategory() {
    return [
      Categoryy(
          color: MyThemeData.redColor,
          id: "sports",
          imageUrl: "assets/images/sports.png",
          title: "Sports"),
      Categoryy(
          color: MyThemeData.darkBlueColor,
          id: "politics",
          imageUrl: "assets/images/politics.png",
          title: "Politics"),
      Categoryy(
          color: MyThemeData.binkColor,
          id: "health",
          imageUrl: "assets/images/health.png",
          title: "Health"),
      Categoryy(
          color: MyThemeData.brownColor,
          id: "business",
          imageUrl: "assets/images/bussines.png",
          title: "Business"),
      Categoryy(
          color: MyThemeData.blueColor,
          id: "entertainment",
          imageUrl: "assets/images/environment.png",
          title: "Entertainment"),
      Categoryy(
          color: MyThemeData.yellowColor,
          id: "science",
          imageUrl: "assets/images/science.png",
          title: "Science"),
    ];
  }
}

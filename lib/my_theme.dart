import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryLightColor = Color(0xFF39A552);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color redColor = Color(0xFFC91C22);
  static Color darkBlueColor = Color(0xFF003E90);
  static Color binkColor = Color(0xFFED1E79);
  static Color brownColor = Color(0xFFCF7E48);
  static Color blueColor = Color(0xFF4882CF);
  static Color yellowColor = Color(0xFFF2D352);
  static Color greyColor = Color(0xff4F5A69);
  static Color blackColor = Color(0xFF303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: MyThemeData.whiteColor,size: 35,),
      backgroundColor: primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

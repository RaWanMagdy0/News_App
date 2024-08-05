import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Column(
            children: [
              Icon(
                Icons.close,
                size: 20,
                color: MyThemeData.primaryLightColor,
              ),
              Text(
                " search article",
                style: TextStyle(
                  color: MyThemeData.primaryLightColor,
                ),
              ),
              Icon(
                Icons.search,
                color: MyThemeData.primaryLightColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

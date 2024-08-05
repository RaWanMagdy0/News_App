import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories=1;
  static const int settings=2;
  Function onDrwerItemCick;

  HomeDrawer({required this.onDrwerItemCick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          width: double.infinity,
          color: MyThemeData.primaryLightColor,
          child: Text(
            "News App!",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            onDrwerItemCick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "categories",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrwerItemCick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "settings",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

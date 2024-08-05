import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/settings/setting_tab.dart';
import 'package:news_app/tabs/home_drawer.dart';

import '../category/category_fragments.dart';
import '../news_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyThemeData.whiteColor,
            child: Image.asset(
              "assets/images/pattern.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedDrawerItem == HomeDrawer.settings
                  ? "Setting"
                  : selectedcategory == null
                      ? "New App"
                      : selectedcategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                  onPressed: ()=>showSearch(context: context, delegate: NewsSearchDelegate()),
                  icon: Icon(Icons.search_outlined,size: 32,),)
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrwerItemCick: onDrawerItemClick),
          ),
          body: selectedDrawerItem == HomeDrawer.settings
              ? SettingTab()
              : selectedcategory == null
                  ? CategoryFragments(onCategoryClick: onCategoryClick)
                  : CategoryDetails(category: selectedcategory!),
        ),
      ],
    );
  }

  Categoryy? selectedcategory;

  void onCategoryClick(Categoryy newselectedcategory) {
    selectedcategory = newselectedcategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;
  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedcategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

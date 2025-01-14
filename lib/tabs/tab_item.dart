import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
bool isSelected;
Source source;
TabItem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: MyThemeData.primaryLightColor,
          width: 3,
        ),
        color: isSelected ?MyThemeData.primaryLightColor:Colors.transparent
      ),
      child:Text(source.name??"",style: TextStyle(
        fontSize: 18,
        color: isSelected?MyThemeData.whiteColor :MyThemeData.primaryLightColor
      ),) ,
    );
  }
}

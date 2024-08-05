import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';

class CategoryItem extends StatelessWidget {
  Categoryy category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomLeft: Radius.circular(index % 2 != 0 ? 20 : 0),
          )),
      child: Column(
        children: [
          Image.asset(
            category.imageUrl,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(category.title,style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}

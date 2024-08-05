import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';

class CategoryFragments extends StatelessWidget {
  var categoriesList=Categoryy.getCategory();
  Function onCategoryClick;
  CategoryFragments({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("pick your category\nof interest",
          style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
            )
                , itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(category: categoriesList[index], index: index));
            },
              itemCount:categoriesList.length ,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

import 'api/api_manager.dart';
import 'api/news/news_item.dart';
import 'model/NewsResponse.dart';

class NewsSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: ()=>showResults(context), icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.close));

  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query??""),
        builder: (context, snapshot) {
          if (snapshot.connectionState==ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went Wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.searchNews(query??"");
                    },
                    child: Text("try again"))
              ],
            );
          }  if (snapshot.data?.status !='ok') {
            return Column(
              children: [
                Text(snapshot.data?.message??""),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("try again"))
              ],
            );
          }
          var newsList = snapshot.data?.articles??[];
          return ListView.builder(
            itemBuilder: (context,index){
              return NewsItem(news:newsList[index]);
            },
            itemCount: newsList.length,
          );
        },

      );
    }else{
      return Container();
    }  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //We will execute the same code as above(buildResults)
  return buildResults(context);

  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: MyThemeData.primaryLightColor,
      inputDecorationTheme:InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ) ,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: MyThemeData.whiteColor,size: 35,),
        backgroundColor: MyThemeData.primaryLightColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),

      ),
    );
  }
}
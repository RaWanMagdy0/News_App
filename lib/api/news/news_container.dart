import 'package:flutter/material.dart';
import 'package:news_app/api/news/cubit/news_container_view_model.dart';
import 'package:news_app/api/news/news_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

import '../api_manager.dart';


class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({required this.source});

  NewsCountainerViewModel viewModel =
      NewsCountainerViewModel(repositoryContract: injectNewsRepository());

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getNewsBySourceId(source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(source.id??""),
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
                    ApiManager.getNewsBySourceId(source.id??"");

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
  }
}

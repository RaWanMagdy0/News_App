import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/category/cubit/category_details_view_model.dart';
import 'package:news_app/category/cubit/states.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/repository/sources/repository/source_repository_impl.dart';
import 'package:news_app/tabs/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routName = "CategoryDetails";
  Categoryy category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(
      repositoryContract: injectSourceRepositryContract());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, states) {
          if (states is SourceLoadingStates) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          } else if (states is SourceErrorStates) {
            return Column(
              children: [
                Text(states.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getInstance();
                      setState(() {
                        viewModel.getSourcesByCategoryId(widget.category.id);
                      });
                    },
                    child: Text("try again"))
              ],
            );
          } else if (states is SourceSuccessState) {
            return TabContainer(sourcesList: states.sourceList);
          }
          return Container();
        });
  }
}

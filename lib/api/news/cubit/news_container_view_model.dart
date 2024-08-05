import 'package:bloc/bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/cubit/states.dart';
import 'package:news_app/repository/news/datasource/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

import '../../../repository/news/repository/news_repository_contract.dart';

class NewsCountainerViewModel extends Cubit<NewsStates> {
  late NewsRepositoryContract repositoryContract;

  NewsCountainerViewModel({required this.repositoryContract}) : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      emit(MessageState(message: 'Loading....'));
      var response = await repositoryContract.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message));
      } else {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: "Error Loading News List"));
    }
  }
}

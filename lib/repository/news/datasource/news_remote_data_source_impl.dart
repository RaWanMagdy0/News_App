import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String? sourceId) async {
    var response = await ApiManager.getNewsBySourceId(sourceId!);
    return response;
  }
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
 return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

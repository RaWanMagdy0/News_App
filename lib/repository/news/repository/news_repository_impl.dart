import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/datasource/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource,});

  @override
  Future<NewsResponse> getNewsBySourceId(String? sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
 NewsRepositoryContract injectNewsRepository(){
return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());

}
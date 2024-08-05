import 'package:news_app/model/SourceResponse.dart';

import '../../../model/NewsResponse.dart';

abstract class NewsRepositoryContract{
  Future<NewsResponse>getNewsBySourceId(String ? sourceId);
}
abstract class NewsRemoteDataSource{
  Future<NewsResponse>getNewsBySourceId(String ? sourceId);

}
abstract class NewsOfflineDataSource{
  Future<NewsResponse>getNewsBySourceId(String ? sourceId);

}
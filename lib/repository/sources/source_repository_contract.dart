import 'package:news_app/model/SourceResponse.dart';

abstract class SourceRepositoryContract{
 Future<SourceResponse>getSourceByCategoryId(String? categoryId);
}
abstract class SourceRemoteDataSourece{
 Future<SourceResponse>getSourceByCategoryId(String? categoryId);
}

abstract class SourceOfflineDataSourece {}


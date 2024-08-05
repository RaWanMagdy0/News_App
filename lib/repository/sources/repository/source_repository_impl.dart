import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/sources/source_repository_contract.dart';

import '../datasource/source_remote_data_source_impl.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSourece remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse> getSourceByCategoryId(String? categoryId) {
    return remoteDataSource.getSourceByCategoryId(categoryId);
  }
}
SourceRepositoryContract injectSourceRepositryContract(){
return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}
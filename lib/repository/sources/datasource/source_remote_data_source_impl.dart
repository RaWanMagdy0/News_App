import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import '../source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSourece {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse> getSourceByCategoryId(String? categoryId) async {
    var response = await ApiManager.getSources(categoryId!);
    return response;
  }
}
SourceRemoteDataSourece injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager:ApiManager.getInstance());
}


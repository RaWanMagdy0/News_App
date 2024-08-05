import 'package:bloc/bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/category/cubit/states.dart';
import 'package:news_app/repository/sources/repository/source_repository_impl.dart';

import '../../repository/sources/source_repository_contract.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  late SourceRepositoryContract repositoryContract;

  CategoryDetailsViewModel({required this.repositoryContract}) : super(SourceLoadingStates()) ;

  void getSourcesByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingStates());
      var response = await repositoryContract.getSourceByCategoryId(categoryId);
      if (response.status == "error") {
        emit(SourceErrorStates(errorMessage: response.message));
      } else {
        emit(SourceSuccessState(sourceList: response.sources!));
      }
    } catch (e) {
      emit(SourceErrorStates(errorMessage: "error Loding Source List"));
    }
  }
}

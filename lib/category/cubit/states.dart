 import '../../model/SourceResponse.dart';

abstract class SourceStates{}
 class SourceInitialStates extends SourceStates{}
 class SourceLoadingStates extends SourceStates{}
class SourceErrorStates extends SourceStates{
 String ?errorMessage;
 SourceErrorStates({required this.errorMessage});
}
class SourceSuccessState extends SourceStates{
 List<Source> sourceList;
 SourceSuccessState({required this.sourceList});
}
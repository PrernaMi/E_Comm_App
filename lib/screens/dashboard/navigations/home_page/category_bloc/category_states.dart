import 'package:e_com_app_firebase/models/category_model.dart';
import 'package:e_com_app_firebase/models/product_model.dart';

abstract class CategoryStates{}

class InitialState extends CategoryStates{}
class LoadingState extends CategoryStates{}
class LoadedState extends CategoryStates{
  CategoryModel mCategory;
  LoadedState({required this.mCategory});
}
class ErrorState extends CategoryStates{
  String errorMsg;
  ErrorState({required this.errorMsg});
}


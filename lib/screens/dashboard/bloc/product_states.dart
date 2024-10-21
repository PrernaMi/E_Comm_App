import 'package:e_com_app_firebase/models/category_model.dart';

abstract class ProductState{}

class InitialState extends ProductState{}
class LoadingState extends ProductState{}
class LoadedState extends ProductState{
  CategoryModel mCategory;
  LoadedState({required this.mCategory});
}
class ErrorState extends ProductState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}


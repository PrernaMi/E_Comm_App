import '../../../models/product_model.dart';

abstract class ProductState{}


class PInitialState extends ProductState{}
class PLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  ProductModel mProduct;
  ProductLoadedState({required this.mProduct});
}
class PErrorState extends ProductState{
  String errorMsg;
  PErrorState({required this.errorMsg});
}
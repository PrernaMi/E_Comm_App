import 'package:e_com_app_firebase/models/view_cart_model.dart';

abstract class ViewCartState{}

class ViewCartInitialState extends ViewCartState{}
class ViewCartLoadingState extends ViewCartState{}
class ViewCartLoadedState extends ViewCartState{
  ViewCartModel viewCartModel;
  ViewCartLoadedState({required this.viewCartModel});
}
class ViewCartErrorState extends ViewCartState{
  String errorMsg;
  ViewCartErrorState({required this.errorMsg});
}
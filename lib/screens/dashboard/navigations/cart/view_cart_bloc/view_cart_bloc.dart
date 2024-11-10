import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/models/view_cart_model.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_events.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewCartBloc extends Bloc<ViewCartEvents,ViewCartState>{
  AppRepo appRepo;
  ViewCartBloc({required this.appRepo}):super(ViewCartInitialState()){
    on<GetViewCart>((event,emit)async{
      emit(ViewCartLoadingState());
      try{
        var response = await appRepo.getViewCart();
        if(response != null){
          emit(ViewCartLoadedState(viewCartModel: ViewCartModel.fromJson(response)));
        }else{
          emit(ViewCartErrorState(errorMsg: "No Data Loaded..."));
        }
      }catch(e){
        emit(ViewCartErrorState(errorMsg: e.toString()));
      }
    });
  }
}
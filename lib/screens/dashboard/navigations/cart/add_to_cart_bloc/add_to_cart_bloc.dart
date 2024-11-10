import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_events.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartBloc extends Bloc<AddToCartEvent,AddToCartStates>{
  AppRepo appRepo;
  AddToCartBloc({required this.appRepo}):super(AddToCartInitialState()){
    on<AddToCart>((event,emit)async{
      emit(AddToCartLoading());
      try{
        dynamic data = await appRepo.addToCart(bodyParams: {
          "product_id":event.product_id,
          "quantity":event.count
        });
        if(data['status'] == 'true' || data['status']){
          emit(AddToCartSuccess());
        }else{
          emit(AddToCartError(errormsg: data['status']));
        }
      }catch(e){
        emit(AddToCartError(errormsg: e.toString()));
      }
    });
  }
}
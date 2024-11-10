import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/delete_cart_bloc/del_cart_event.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/delete_cart_bloc/del_cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelCartBloc extends Bloc<DelCartEvent,DelCartState>{
  AppRepo appRepo;
  DelCartBloc({required this.appRepo}):super(DelCartInitialState()){
    on<DeleteCart>((event,emit)async{
      emit(DelCartLoadingState());
      try{
        var data = await appRepo.deleteCart(Body: event.mBody);
        if(data['status']){
          emit(DelCartLoadedState());
        }else{
          emit(DelCartErrorState(errorMsg: data['message']));
        }
      }catch(e){
        emit(DelCartErrorState(errorMsg: e.toString()));
      }
    });
  }
}
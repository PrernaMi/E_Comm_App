import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/decrease_quantity_bloc/dec_state.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/decrease_quantity_bloc/desc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecreaseProductBloc extends Bloc<DecreaseProEvent,DescQtyState>{
  AppRepo appRepo;
  DecreaseProductBloc({required this.appRepo}):super(DescQtyInitialState()){
    on<DescreaseProduct>((event,emit)async{
      emit(DescQtyLoadingState());
      try{
        var response = await appRepo.decreaseProduct(mBody: event.mBody);
        if(response['status']){
          emit(DescQtyLoadedState());
        }else{
          emit(DescQtyErrorState(errorMsg: response['message']));
        }
      }catch(e){
        rethrow;
      }
    });
  }
}
import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_event.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_model.dart';
import '../category_bloc/category_events.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  AppRepo appRepo;
  ProductBloc({required this.appRepo}):super(PInitialState()){
    on<GetProduct>((event,emit)async{
      emit(PLoadingState());
      try{
        dynamic data = await appRepo.getProduct();
        if(data['status']){
          emit(ProductLoadedState(mProduct: ProductModel.fromJson(data)));
        }else{
          emit(PErrorState(errorMsg: data['status']));
        }
      }catch(e){
        emit(PErrorState(errorMsg: e.toString()));
      }
    });
  }
}
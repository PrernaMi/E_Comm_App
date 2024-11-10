import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/models/category_model.dart';
import 'package:e_com_app_firebase/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_events.dart';
import 'category_states.dart';

class CategoryBloc extends Bloc<CategoryEvents,CategoryStates>{
  AppRepo appRepo;
  CategoryBloc({required this.appRepo}):super(InitialState()){
    on<GetCategory>((event,emit)async{
      emit(LoadingState());
      try{
        dynamic data = await appRepo.getCategory();
        if(data['status']){
          emit(LoadedState(mCategory: CategoryModel.fromJson(data)));
        }else{
          emit(ErrorState(errorMsg: data['message']));
        }
      }catch(e){
        emit(ErrorState(errorMsg: e.toString()));
      }
    });
  }
}
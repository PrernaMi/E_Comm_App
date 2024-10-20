import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_events.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  SharedPreferences?prefs;
  AppRepo? appRepo;
  RegisterBloc({required this.appRepo}):super(InitialState()){
    on<UserRegisterEvent>((event,emit)async{
      emit(LoadingState());
      try{
        dynamic data = await appRepo!.registerRepo(mBody: event.bodyParams);
        if(data['status']){
          emit(SuccessState());
        }else{
          emit(ErrorState(errorMsg: data['message']));
        }
      }catch(e){
        emit(ErrorState(errorMsg: e.toString()));
      }
    });
  }

}
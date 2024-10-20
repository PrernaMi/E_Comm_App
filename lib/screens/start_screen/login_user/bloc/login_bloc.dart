import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_event.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_states.dart';
import 'package:e_com_app_firebase/widget_constant/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{
  SharedPreferences?prefs;
  AppRepo appRepo;

  LoginBloc({required this.appRepo}):super(InitialState()){
    on<LoginUserEvent>((event,emit)async{
      emit(LoadingState());
      try{
        var data = await appRepo.loginRepo(mBody: event.mBody);
        if(data['status']){
          prefs = await SharedPreferences.getInstance();
          prefs!.setString(AppConst.Prefs_UID_tokan, data['tokan']);
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
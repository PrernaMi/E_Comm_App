import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/models/profile_model.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/home_page/profile_bloc/profile_event.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/home_page/profile_bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  AppRepo appRepo;
  ProfileBloc({required this.appRepo}):super(ProfileInitialState()){
    on<GetProfile>((event,emit)async{
      emit(ProfileLoadingState());
      try{
        var profileData = await appRepo.profileInfo();
        if(profileData!= null){
          emit(ProfileLoadedState(profileModel: ProfileModel.fromJson(profileData)));
        }else{
          emit(ProfileErrorState(errorMsg: "No data Loaded.."));
        }
      }catch(e){
        emit(ProfileErrorState(errorMsg: e.toString()));
      }
    });
  }
}
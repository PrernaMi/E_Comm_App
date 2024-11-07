import '../../../../../models/profile_model.dart';
abstract class ProfileState{}

class ProfileInitialState extends ProfileState{}
class ProfileLoadedState extends ProfileState{
  ProfileModel profileModel;
  ProfileLoadedState({required this.profileModel});
}
class ProfileLoadingState extends ProfileState{
}
class ProfileErrorState extends ProfileState{
  String errorMsg;
  ProfileErrorState({required this.errorMsg});
}
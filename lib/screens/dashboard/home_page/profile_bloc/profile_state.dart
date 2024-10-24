abstract class ProfileState{}

class ProfileInitialState extends ProfileState{}
class ProfileLoadedState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class ProfileErrorState extends ProfileState{
  String errorMsg;
  ProfileErrorState({required this.errorMsg});
}
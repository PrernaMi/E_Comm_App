abstract class RegisterEvent{}

class UserRegisterEvent extends RegisterEvent{
  Map<String,dynamic> bodyParams;
    UserRegisterEvent({required this.bodyParams});
}
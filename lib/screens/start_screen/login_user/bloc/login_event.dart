abstract class LoginEvents{}

class LoginUserEvent extends LoginEvents{
  Map<String,dynamic> mBody;
  LoginUserEvent({required this.mBody});
}
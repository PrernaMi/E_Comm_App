abstract class RegisterState{}

class InitialState extends RegisterState{}
class LoadingState extends RegisterState{}
class SuccessState extends RegisterState{}
class ErrorState extends RegisterState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}
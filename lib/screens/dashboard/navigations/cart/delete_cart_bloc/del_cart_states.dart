abstract class DelCartState{}

class DelCartInitialState extends DelCartState{}
class DelCartLoadingState extends DelCartState{}
class DelCartLoadedState extends DelCartState{}
class DelCartErrorState extends DelCartState{
  String errorMsg;
  DelCartErrorState({required this.errorMsg});
}
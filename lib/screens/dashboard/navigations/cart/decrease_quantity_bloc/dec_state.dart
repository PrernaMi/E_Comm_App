abstract class DescQtyState{}

class DescQtyInitialState extends DescQtyState{}
class DescQtyLoadingState extends DescQtyState{}
class DescQtyLoadedState extends DescQtyState{}
class DescQtyErrorState extends DescQtyState{
  String errorMsg;
  DescQtyErrorState({required this.errorMsg});
}
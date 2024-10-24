abstract class AddToCartStates{}

class AddToCartInitialState extends AddToCartStates{}
class AddToCartLoading extends AddToCartStates{}
class AddToCartSuccess extends AddToCartStates{}
class AddToCartError extends AddToCartStates{
  String errormsg;
  AddToCartError({required this.errormsg});
}
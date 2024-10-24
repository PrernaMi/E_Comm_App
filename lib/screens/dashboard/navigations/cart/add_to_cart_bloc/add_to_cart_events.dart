abstract class AddToCartEvent{}

class AddToCart extends AddToCartEvent{
  int count;
  int product_id;
  AddToCart({required this.count,required this.product_id});
}
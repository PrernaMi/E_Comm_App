abstract class DelCartEvent{}

class DeleteCart extends DelCartEvent{
  Map<String,dynamic> mBody;
  DeleteCart({required this.mBody});
}
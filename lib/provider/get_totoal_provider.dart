import 'package:flutter/foundation.dart';

import '../models/view_cart_model.dart';

class GetTotalProvider extends ChangeNotifier{
  num _totalAmt = 0;

  void calculateAmt({required ViewCartModel totalList}){
    _totalAmt = 0;
    if(totalList.data == null){
      _totalAmt = 0;
    }
    else{
      for(int i = 0; i < totalList.data!.length ; i++){
        _totalAmt += int.parse(totalList.data![i].price!);
        _totalAmt *= totalList.data![i].quantity!;
      }
    }
    notifyListeners();
  }

  num getAmt()=>_totalAmt;

}
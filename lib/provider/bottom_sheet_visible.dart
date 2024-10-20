import 'package:flutter/cupertino.dart';

class BottomSheetVisible extends ChangeNotifier {
  bool _isvisible = true;

  void changeVisibility({required bool isChange}) async {
    _isvisible = isChange;
    notifyListeners();
  }

  bool getVisibility() => _isvisible;
}

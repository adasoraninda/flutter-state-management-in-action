import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String _fruit = "Unknown";

  get fruit => _fruit;

  void changeFruit(String fruitName) {
    _fruit = fruitName;
    notifyListeners();
  }
}

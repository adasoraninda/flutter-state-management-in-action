import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = ChangeNotifierProvider((_) => MyProvider());

class MyProvider extends ChangeNotifier {
  String _fruit = "Unknown";

  String get fruit => _fruit;

  void changeFruit(String fruitName) {
    _fruit = fruitName;
    notifyListeners();
  }
}

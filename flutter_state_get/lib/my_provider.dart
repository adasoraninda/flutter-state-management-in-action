import 'package:get/get.dart';

class MyProvider extends GetxController {
  final RxString _fruit = "Unknown".obs;

  RxString get fruit => _fruit;

  void changeFruit(String fruit) {
    _fruit.value = fruit;
  }
}

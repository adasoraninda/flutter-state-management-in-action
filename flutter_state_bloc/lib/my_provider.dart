import 'package:flutter_bloc/flutter_bloc.dart';

class MyProvider extends Cubit<String> {
  MyProvider() : super('Unknown');

  void changeFruit(String fruit) => emit(fruit);
}

import 'package:flutter/material.dart';
import 'package:flutter_state_get/my_provider.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final MyProvider myProvider = Get.put(MyProvider());

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(myProvider.fruit.value)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("Banana", (title) {
                myProvider.changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Mango", (title) {
                myProvider.changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Apple", (title) {
                myProvider.changeFruit(title);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String? title, Function(String)? onTap) {
    return ElevatedButton(
      onPressed: title == null
          ? null
          : () {
              if (onTap != null) {
                onTap(title);
              }
            },
      child: Text(title ?? "Unknown"),
    );
  }
}

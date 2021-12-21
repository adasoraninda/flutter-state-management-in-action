import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => MyProvider(),
        child: const App(),
      ),
    );

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = context.read<MyProvider>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<MyProvider>(
            builder: (context, myProvider, _) {
              return Text(myProvider.fruit);
            },
          ),
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

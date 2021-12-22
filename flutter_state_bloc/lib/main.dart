import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_bloc/my_provider.dart';

void main() => runApp(
      BlocProvider(
        create: (_) => MyProvider(),
        child: const App(),
      ),
    );

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<MyProvider, String>(
            builder: (context, state) => Text(state),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("Banana", (title) {
                context.read<MyProvider>().changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Mango", (title) {
                context.read<MyProvider>().changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Apple", (title) {
                context.read<MyProvider>().changeFruit(title);
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

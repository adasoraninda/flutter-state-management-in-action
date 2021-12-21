import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_riverpod/my_provider.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(ref.watch(myProvider).fruit),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("Banana", (title) {
                ref.read(myProvider).changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Mango", (title) {
                ref.read(myProvider).changeFruit(title);
              }),
              const SizedBox(height: 10),
              buildButton("Apple", (title) {
                ref.read(myProvider).changeFruit(title);
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

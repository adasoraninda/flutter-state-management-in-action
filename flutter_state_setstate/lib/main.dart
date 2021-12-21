import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  StateApp createState() => StateApp();
}

class StateApp extends State<App> {
  String _title = "Unknown";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("Banana", (title) {
                setState(() {
                  _title = title;
                });
              }),
              const SizedBox(height: 10),
              buildButton("Mango", (title) {
                setState(() {
                  _title = title;
                });
              }),
              const SizedBox(height: 10),
              buildButton("Apple", (title) {
                setState(() {
                  _title = title;
                });
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

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic layout App'),
        ),
        body: Center(
          child: Text("Hello layouts"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.lightbulb_outline),
          onPressed: () {
            print("Button pressed");
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          accentColor: Colors.teal[700],
          textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 20, fontStyle: FontStyle.italic))),
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
        persistentFooterButtons: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add_comment)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alarm)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_location)),
        ],
      ),
    );
  }
}

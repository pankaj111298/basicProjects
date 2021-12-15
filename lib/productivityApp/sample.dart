import 'package:flutter/material.dart';   

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rows and columns",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeX =
        MediaQuery.of(context).size.width; //to get the full width of the screen
    final sizeY = MediaQuery.of(context)
        .size
        .height; //to get the full height of the screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Rows and Columns"),
      ),
      body: Container(
        width: sizeX,
        height: sizeY,
        child: Column(children: createSquares(4),),
      ),
    );
  }
  List<Widget> createSquares(int numberOfSquares) {
    int i = 0;
    List<Widget> squares = [];
    List color = [Colors.amber, Colors.cyan, Colors.lightGreen, Colors.orange];
    while (i < numberOfSquares) {
      Container square = new Container(
        color: color[i],
        child: Text(i.toString()),
      );
      squares.add(square);
    }
    return squares;
  }
}

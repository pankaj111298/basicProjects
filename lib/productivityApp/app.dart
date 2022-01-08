import 'package:flutter/material.dart';

void main() {
  runApp(ProductivityApp());
}

class ProductivityApp extends StatefulWidget {
  const ProductivityApp({Key? key}) : super(key: key);

  @override
  State<ProductivityApp> createState() => _ProductivityAppState();
}

class _ProductivityAppState extends State<ProductivityApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ProductivityApp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Productivity Timer"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Column(
          children: [
            TopRow(),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 10, color: Colors.green)),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(DateTime.now().minute.toString()),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Stop"),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  primary: Colors.deepOrangeAccent.shade400),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Restart"),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  primary: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class TopRow extends StatefulWidget {
  const TopRow({Key? key}) : super(key: key);

  @override
  _TopRowState createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Work"),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                primary: Colors.deepOrangeAccent.shade400),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Short Break"),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                primary: Colors.green),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Long Break"),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                primary: Colors.green.shade700),
          ),
        ],
      ),
    );
  }
}

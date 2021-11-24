import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Area Calculator",
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 20, fontStyle: FontStyle.italic))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Area Calculator"),
        ),
        body: areaCalculatorForm(),
      ),
    );
  }
}

class areaCalculatorForm extends StatefulWidget {
  const areaCalculatorForm({Key? key}) : super(key: key);

  @override
  _areaCalculatorFormState createState() => _areaCalculatorFormState();
}

class _areaCalculatorFormState extends State<areaCalculatorForm> {
  late String result;
  double width = 0;
  double height = 0;
  String? currentShape;
  final heightContoller = TextEditingController();
  final widthController = TextEditingController();
  List<String> shapes = ['Traingle', 'Rectangle'];

  @override
  void initState() {
    super.initState();
    result = '0';
    currentShape = 'Rectangle';
    heightContoller.addListener(updateHeight);
    widthController.addListener(updateWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: currentShape,
            isExpanded: true,
            items: shapes.map((value) {
              return DropdownMenuItem<String>(
                  child: new Text(value), value: value);
            }).toList(),
            onChanged: (shape) {
              setState(() {
                currentShape = shape;
              });
            },
          ),
          TextField(
            controller: heightContoller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter height"),
          ),
          TextField(
            controller: widthController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter base"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Area"))
        ],
      ),
    );
  }

  void updateHeight() {
    setState(() {
      if (heightContoller.text != '') {
        height = double.parse(heightContoller.text);
      } else {
        height = 0;
      }
    });
  }

  void updateWidth() {
    setState(() {
      if (widthController.text != '') {
        width = double.parse(widthController.text);
      } else {
        width = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const AreaTextField(this.controller, this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
        ));
  }
}

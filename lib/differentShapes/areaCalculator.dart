// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:math';

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
          brightness: Brightness.dark,
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
  bool additionalField = true;
  late String currentShape;
  final heightContoller = TextEditingController();
  final widthController = TextEditingController();
  List<String> shapes = ['Triangle', 'Rectangle', 'Circle', 'Square'];

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
      child: SingleChildScrollView(
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
                  currentShape = shape!;
                  if (shape == 'Circle' || shape == 'Square') {
                    additionalField = false;
                  } else {
                    additionalField = true;
                  }
                });
              },
            ),
            //shape
            ShapeContainer(currentShape),
            AreaTextField(
                widthController, currentShape == 'Circle' ? 'Radius' : 'Width'),
            Visibility(
                visible: additionalField,
                child: AreaTextField(heightContoller, "Height")),
            ElevatedButton(
                onPressed: calculateArea, child: Text("Calculate Area")),
            Text(result)
          ],
        ),
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

  void calculateArea() {
    late double area;
    if (currentShape == 'Rectangle') {
      area = height * width;
    } else if (currentShape == 'Triangle') {
      area = (height * width) / 2;
    } else if (currentShape == 'Square') {
      area = width * width;
    } else if (currentShape == 'Circle') {
      area = pi * width * width;
    }
    setState(() {
      result = 'The area is :' + area.toStringAsFixed(2);
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
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: (this.hint == 'Width')
                  ? Icon(Icons.border_bottom_sharp)
                  : Icon(Icons.border_left_sharp),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }
}

class ShapeContainer extends StatelessWidget {
  final String shape;
  const ShapeContainer(this.shape);

  @override
  Widget build(BuildContext context) {
    if (shape == 'Triangle') {
      return CustomPaint(
        size: Size(50, 50),
        painter: TrianglePainter(),
      );
    } else if (shape == 'Rectangle') {
      return CustomPaint(
        size: Size(50, 50),
        painter: RectanglePainter(),
      );
    } else if (shape == 'Circle') {
      return CustomPaint(
        size: Size(50, 50),
        painter: CirclePainter(),
      );
    } else if (shape == 'Square') {
      return CustomPaint(
        size: Size(50, 50),
        painter: SquarePainter(),
      );
    }
    return Container();
  }
}

class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;
    Rect rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), width: 40, height: 40);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.lightBlueAccent;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.lime.shade600;
    Rect rect =
        Rect.fromLTRB(0, size.height / 4, size.width, size.height / 4 * 3);
    /**Canvas will draw the shape on the application 
    * Paint is used for styling 
    * Rect is used for setting path for the  rectangle
    * Example you describe the rect styling it with Paint and drawing it with Canvas
    */
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.teal.shade100;
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.width);
    /**Canvas will draw the shape on the application 
    * Paint is used for styling 
    * Path is used to  complex forms using the parts of the path
    * Example you describe the path styling it with Paint and drawing it with Canvas
    */
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

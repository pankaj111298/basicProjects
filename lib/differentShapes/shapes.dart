import 'package:flutter/material.dart';

void main() {
  runApp(Shapes());
}

class Shapes extends StatelessWidget {
  const Shapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shapes App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shapes App"),
        ),
        /**Rules of the container 
         * 1) Containers with a child will size themselves to the child
         * 2)Containers with no children will be as big as possible to the parent bounded (Restricted to the size) constraints
         * 3) Containers with no children will be as small as possible,when their parent is having unbounded(Not restricted to the size) constraints
        */
        body: Container(
          margin: EdgeInsets.all(50),
          /** Margin is used for postioning the container on the screen */
          padding: EdgeInsets.all(70),
          /**Padding is used for postioning the child elements inside the container */
          width: 300.0,
          height: 300.0,
          //child: Text("Testing the container"),
          /**Styling the container with the decoration property */
          decoration: BoxDecoration(
              color: Colors.lime,
              /** Gradient is property is used to apply effect on the container 
               * If graident and color is given for the container colors gets orverrided
               * If image ,gradient and color is given for the container gradient and color gets overrided
              */
              gradient: LinearGradient(
                  colors: [
                    Colors.lightGreen.shade50,
                    Colors.lightGreen.shade900
                  ],
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, -0.4),
                  tileMode: TileMode.repeated),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}

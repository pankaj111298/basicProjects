import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rows and Columns",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Row and Columns"),
          ),
          body: Squares()),
    );
  }
}

class Squares extends StatelessWidget {
  const Squares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX =
        MediaQuery.of(context).size.width; //To get the width of whole screen
    final sizeY =
        MediaQuery.of(context).size.height; //To get the height of whole screen

    return Container(
      width: sizeX,
      height: sizeY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        /**
         * To align the wigets in rows and columns 
         * If the widget is row then the mainAxisAlignment will be horizontal
         * If the widget is column then the mainAxisAlignment will be vertical
         * and the properties will be same for the both widgets
         * For eg:MainAxisAlignment.center for the row then the widget will be in center horizontally
         */
        verticalDirection: VerticalDirection.up,
        /**
         * This property will change the direction of the text and the widget 
         * Over here up means  all the things will be in descending order by default it is in ascending order
         * */

        // textDirection: TextDirection.rtl,
        /**
         * This property will change the direction of the text and the widget 
         * Over here rtl means right to left so the MainAxisAlignment.end will be the start of the main axis
         * */
        crossAxisAlignment: CrossAxisAlignment.center,
        /**
         * the Strectch property will strecth the crossaxis to the end of the screen
         * To align the wigets in rows and columns for the opposite axis
         * If the widget is row then the crossAxisAlignment will be vertical
         * If the widget is column then the crossAxisAlignment will be horizontal
         * For eg:CrossAxisAlignment.start for the row then will be on top in vertically
         */
        children: getSquares(5),
      ),
    );
  }

  List<Widget> getSquares(int numberofSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.cyan,
      Colors.deepPurple,
      Colors.orangeAccent,
      Colors.yellow
    ];
    List<Widget> squares = [];
    while (i < numberofSquares) {
      /**The Expanded widget will expand the mainAxisALignment of the Row or Column whichever added 
       * it has also the flex property which will assign how much size does a widget should take
       */
      Expanded square = new Expanded(
          flex: i,
          child: Container(
            // width: 50,
            height: 50,
            color: colors[i],
            child: Text(i.toString()),
          ));
      i++;
      squares.add(square);
    }
    return squares;
  }
}

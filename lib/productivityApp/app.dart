// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:hello_layouts/productivityApp/TimerModel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(ProductivityApp());
}

class ProductivityApp extends StatelessWidget {
  const ProductivityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: TimerModel(),
      child: MaterialApp(
        title: 'Productivity Timer',
        debugShowCheckedModeBanner: false,
        home: MainPage(
          title: "Productivity Timer",
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return ScopedModel(
      model: TimerModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => MaterialButton(
                            onPressed: () {
                              model.screenAwake();
                            },
                            color: Color(0xff689F38),
                            minWidth: size / 3.2,
                            child: Text("Work"),
                          )),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => MaterialButton(
                            onPressed: () {
                              model.stopTimer();
                            },
                            color: Colors.red,
                            minWidth: size / 3.2,
                            child: Text("Stop"),
                          )),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => MaterialButton(
                            onPressed: () {
                              model.restartTimer();
                            },
                            color: Color(0xff689F38),
                            minWidth: size / 3.2,
                            child: Text("Restart"),
                          )),
                ],
              ),
              Expanded(
                  child: ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => CircularPercentIndicator(
                            radius: 180.0,
                            lineWidth: 20.0,
                            progressColor: Colors.green,
                            percent: model.radius,
                            center: Text(
                              model.time,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => MaterialButton(
                            onPressed: () {
                              model.shortBreak();
                            },
                            child: Text("Short Break"),
                            color: Color(0xff689F38),
                            minWidth: size / 2.1,
                          )),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => MaterialButton(
                            onPressed: () {
                              model.longBreak();
                            },
                            child: Text("Long Break"),
                            color: Color(0xff689F38),
                            minWidth: size / 2.1,
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

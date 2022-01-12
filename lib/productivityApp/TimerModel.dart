// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:screen/screen.dart';

/** This file is created to create a Timer Model which can be re-used in the different views in the application
 * Explaination of the Scoped Model
 * A set of utilities that allow you to easily pass a data Model from a parent Widget down to its descendants. 
 * In addition, it also rebuilds all of the children that use the model when the model is updated.
 * For more details documentation link :https://pub.dev/packages/scoped_model
 * Medium document link:https://medium.com/flutter-community/flutter-architecture-scopedmodel-a-complete-guide-to-real-world-architecture-205a24674964
 */

class TimerModel extends Model {
  late Timer timer;
  Duration defaultTime = Duration(minutes: 30, seconds: 0);
  late Duration fulltime;
  double _radius = 0;

  String get time => returnTime(defaultTime);
  double get radius => returnRadius(_radius);

  double returnRadius(double _radius) {
    return _radius;
  }

  TimerModel() {
    timer = Timer.periodic(Duration(minutes: 30, seconds: 0), (timer) {});
  }

  String returnTime(Duration time) {
    if (time.inSeconds < 0) {
      stopTimer();
    }
    String timeStamp = time.toString();
    String minutes = timeStamp.substring(2, 4);
    String seconds = timeStamp.substring(5, 7);
    String formattedTime = minutes + " : " + seconds;
    return formattedTime;
  }

  void decrementTime() {
    if (defaultTime.inSeconds > 0) {
      defaultTime = defaultTime - Duration(seconds: 1);
    } else {
      defaultTime = Duration(seconds: 0);
      _radius = 0;
      stopTimer();
    }
    notifyListeners();
  }

  void screenAwake() {
    Screen.keepOn(true);
    _radius = 1;
    defaultTime = Duration(minutes: 30, seconds: 0);
    notifyListeners();
    fulltime = defaultTime;
    startTimer(defaultTime);
  }

  void shortBreak() {
    Screen.keepOn(true);
    _radius = 1;
    defaultTime = Duration(minutes: 5, seconds: 0);
    notifyListeners();
    fulltime = defaultTime;
    startTimer(defaultTime);
  }

  void longBreak() {
    Screen.keepOn(true);
    _radius = 1;
    defaultTime = Duration(minutes: 15, seconds: 0);
    notifyListeners();
    fulltime = defaultTime;
    startTimer(defaultTime);
  }

  void startTimer(Duration time) {
    stopTimer();
    timer = Timer.periodic(Duration(seconds: 1), (timer) => decrementTime());
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    Screen.keepOn(false);
  }

  void restartTimer() {
    if (defaultTime.inSeconds > 0) {
      Screen.keepOn(true);
      timer = Timer.periodic(Duration(seconds: 1), (timer) => decrementTime());
    }
  }
}

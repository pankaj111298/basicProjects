import 'package:flutter/material.dart';

void main() {
  runApp(ChangeTheme());
}

class ChangeTheme extends StatelessWidget {
  final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: notifier,
        builder: (_, mode, __) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: mode,
            home: Scaffold(
              appBar: AppBar(
                title: Text("Changing Theme"),
              ),
              body: Center(
                child: ElevatedButton(
                  child: Text("Change Theme"),
                  onPressed: () {
                    notifier.value = mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),
              ),
            ),
          );
        });
  }
}

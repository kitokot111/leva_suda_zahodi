import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _switchOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider.value(
        value: Switcher(),
        child: MyAppBody(),
      ),
    );
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({super.key});

  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  bool _switchOn = false;

  @override
  Widget build(BuildContext context) {
    Switcher anyColor = Provider.of<Switcher>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homework Provider',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: anyColor.containerColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              color: anyColor.appBarColor,
              width: 200,
              height: 200,
              duration: Duration(
                seconds: 1,
              ),
            ),
            Switch(
                value: _switchOn,
                onChanged: (bool value) {
                  setState(() {
                    anyColor.switchedColor();
                    _switchOn = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class Switcher extends ChangeNotifier {
  Color barColor = Colors.grey;
  Color conColor = Colors.red;

  Color get appBarColor => barColor;

  Color get containerColor => conColor;

  void switchedColor() {
    barColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    conColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }
}

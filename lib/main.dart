import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade600,
          title: Text(
            'Stopwatch',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: _stopWatchBody(),
      ),
    );
  }
}

class _stopWatchBody extends StatefulWidget {
  _stopWatchBody({super.key});

  @override
  State<_stopWatchBody> createState() => _stopWatchBodyState();
}

class _stopWatchBodyState extends State<_stopWatchBody> {

  Timer? timer;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  void start() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int _localSeconds = _seconds + 1;
      int _localMinutes = _minutes;
      int _localHours = _hours;

      if (_localSeconds > 59) {
        if (_localMinutes > 59) {
          _localHours++;
          _localMinutes = 0;
        } else {
          _localMinutes++;
          _localSeconds = 0;
        }
      }

      setState(() {
        _localSeconds = _seconds;
        _localMinutes = _minutes;
        _localHours = _hours;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_hours',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ':',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '$_minutes',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ':',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '$_seconds',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  start();
                },
                child: Text(
                  'Start',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Pause',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hours = 0;
                    _minutes = 0;
                    _seconds = 0;
                  });
                },
                child: Text(
                  'Reset',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

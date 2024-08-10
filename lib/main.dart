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

  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  @override
  State<_stopWatchBody> createState() => _stopWatchBodyState();
}

class _stopWatchBodyState extends State<_stopWatchBody> {
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
                'hhh',
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
                'mmm',
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
                'sss',
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
                  setState(() {

                  });
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
                onPressed: () {},
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






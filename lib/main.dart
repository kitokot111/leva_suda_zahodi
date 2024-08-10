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
  const _stopWatchBody({super.key});

  @override
  State<_stopWatchBody> createState() => _stopWatchBodyState();
}

class _stopWatchBodyState extends State<_stopWatchBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
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
                  'Countinue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _timer {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _start = true;
  bool _pause = false;
  bool _countinue = false;
}

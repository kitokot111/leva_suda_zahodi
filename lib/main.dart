import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade600,
          title: const Text(
            'STOPWATCH',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const _stopWatchBody(),
      ),
    );
  }
}

class _stopWatchBody extends StatefulWidget {
  const _stopWatchBody();

  @override
  State<_stopWatchBody> createState() => _stopWatchBodyState();
}

class _stopWatchBodyState extends State<_stopWatchBody> {
  Timer? timer;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _startWatch = false;

  void stop() {
    timer!.cancel();
    _startWatch = false;
  }

  void reset() {
    timer!.cancel();
    setState(() {
      _seconds = 0;
      _minutes = 0;
      _hours = 0;
    });
  }

  void start() {
    _startWatch = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = _seconds + 1;
      int localMinutes = _minutes;
      int localHours = _hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        _seconds = localSeconds;
        _minutes = localMinutes;
        _hours = localHours;
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
                style: const TextStyle(fontSize: 45),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$_minutes',
                style: const TextStyle(fontSize: 45),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$_seconds',
                style: const TextStyle(fontSize: 45),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  start();
                },
                child: const Text(
                  'Start',
                ),
              ),
              MaterialButton(
                color: Colors.grey.shade200,
                onPressed: () {
                  stop();
                },
                child: const Text(
                  'Pause',
                ),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  reset();
                },
                child: const Text(
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

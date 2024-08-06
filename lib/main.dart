import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purpleAccent,
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
              titleTextStyle: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              backgroundColor: Colors.purple,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tap "-" to decrement',
                  ),
                  MyCounterWidget(),
                  Text('Tap "+" to increment'),
                ],
              ),
            )));
  }
}

class MyCounterWidget extends StatefulWidget {
  const MyCounterWidget({super.key});

  @override
  State<MyCounterWidget> createState() => _MyCounterWidgetState();
}

class _MyCounterWidgetState extends State<MyCounterWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _count -= 1;
                });
              },
              icon: Icon(Icons.remove)),
          Text('$_count'),
          IconButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}

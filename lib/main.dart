import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello, Flutter!',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),

      ),
    ),
  );
}

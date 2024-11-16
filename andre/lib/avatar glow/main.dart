import 'package:flutter/material.dart';
import 'package:andre/avatar glow/home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
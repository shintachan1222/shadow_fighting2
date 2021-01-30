import 'package:flutter/material.dart';
import 'package:shadow_fighting2/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'シャドウファイティング',
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}

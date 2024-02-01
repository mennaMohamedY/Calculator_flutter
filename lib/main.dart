import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_two/btns.dart';
import 'package:practice_two/calculator_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("statefull Widget")),
          body: CalculatorDesign())
      ,
    );
  }



}



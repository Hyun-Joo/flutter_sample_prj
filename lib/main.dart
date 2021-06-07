import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_prj/rabbit.dart';
import 'package:flutter_sample_prj/stateful_sample_widget.dart';
import 'package:flutter_sample_prj/stateless_sample_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  @override
  void initState() {
    value = 0;
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        value++;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: value > 10 ? Container()
          : StatefulSampleWidget(
              "구멍이 있는 박스로 실험하는 자",
              value,
              Rabbit("개냥토끼2", RabbitState.SLEEP)
            )
    );
  }
}
